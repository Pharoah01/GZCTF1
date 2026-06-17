// SPDX-License-Identifier: LicenseRef-GZCTF-Restricted
// Copyright (C) 2022-2025 GZTimeWalker
// Restricted Component - NOT under AGPLv3.
// See licenses/LicenseRef-GZCTF-Restricted.txt
import { Anchor, Text } from '@mantine/core'
import { FC } from 'react'

interface CopyrightProps {
  isMobile?: boolean
}

export const Copyright: FC<CopyrightProps> = ({ isMobile }) => {
  const currentYear = new Date().getFullYear()

  return (
    <Text size="sm" ta="center" fw={400} c="dimmed">
      © {currentYear} OWASP CTF
      {isMobile && <br />}
      <Anchor href="https://owasp.org/www-chapter-sathyabama-institute-of-science-and-technology/" c="dimmed" size="sm" fw={500}>
         @OWASP Student Chapter | Sathyabama
      </Anchor>
      { /* ,&nbsp;All&nbsp;Rights&nbsp;Reserved. */ }
    </Text>
  )
}
