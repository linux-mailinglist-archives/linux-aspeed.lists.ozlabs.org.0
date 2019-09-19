Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D57FB7CDB
	for <lists+linux-aspeed@lfdr.de>; Thu, 19 Sep 2019 16:33:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Yzps2YjnzDqfC
	for <lists+linux-aspeed@lfdr.de>; Fri, 20 Sep 2019 00:33:09 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YzpP2TcdzF4wG
 for <linux-aspeed@lists.ozlabs.org>; Fri, 20 Sep 2019 00:32:43 +1000 (AEST)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MZSym-1igOhi1TOw-00WWXn; Thu, 19 Sep 2019 16:26:56 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Joel Stanley <joel@jms.id.au>
Subject: [PATCH] ARM: aspeed: ast2500 is ARMv6K
Date: Thu, 19 Sep 2019 16:26:38 +0200
Message-Id: <20190919142654.1578823-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:V9tdOUDtuGUe068WcZJL2K9tTtIESlF6Je8IaB76YM9nrgqfI4E
 b9qk+sCm+bba7I2po2I9hVnAaQqWXex61vapONgnrXW5FHiohTQgglQZlibOGxhEKD9qzot
 Yw4hDZaMBz+tIKqYvR3HhRYIKZl74HVupJ+bkdOqekLBPujC2cL0vvyRSjIwpN8aMcyTxXV
 Ql3aJeSt7/5UyABhcXDmQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WWLG3lrdZpI=:Puk+tZFZzd1BhXZOo/oxWu
 M6q0jw/gIAPOfIZtrvx1EEA/AV2wJfQs6130JFczBH/MHAv0tANF7UyUSW4+ax4j8+zq/jII7
 beaw6pp12VJ5BFOBqL+YJafpGpcYcl8j9PqjgFONABZRwbJWIV2OZNRlc2T54eRixNxH4D6BM
 bN+TO4Ml2pkKpnvlx4Xg5kPr6o86/xw5oulgGiuWS9L9b1BZe/eHtRQMLm9HE/ZBSrj+dQK7b
 i3bqiPfraoRqsgJrauKMuOxwdmjYgU42pD1YpTiZFPRkurLYcbo1MxhVkkv9Umz8k8W6TQ3fL
 xY2gDDf1K/8GVxZyWw/xRpjMiy+PdDS3xZ+S4zfqQb8MITEdOqzjXp9o0+k0kTiwMQxcx4RgV
 0lAY6XqrYyf/r1AZKOr7NdpvKkjZ1RZQstqk+5ljgTgmbmG6WPkHQh4bRXkmd0T7rqPoPEfXx
 RleAKH2YnNim3zzjBd0VJLqpSFJ1p+MZWfo1SwIXalwvk3U0QC8ExeoKNx1OT7gtbe5bI41+U
 Jx1xDj/gc9yMk4VoqUi5wv5nF1U9/yRkq9pDYDwRDRdUDbhWhGtzSWFJeLZzDcnM1q4+gSlg9
 rn4ZQCw1Ze4/spBugGYcjJMsdGJADf8gBDouWeZM9paKtweyNuJUTrNEQ/2DPhEkwL5gIdicc
 WoJvWdDL9Ps7mwKRdLWxd6jK+pshiZ2hyd0BeKXBR+se99cokK5yk4e9cXRyYjWlFOfsl4T7J
 oue7xueddWAzgSFxC3IL82mxz8oAvKYPe7l9y5m6iyJ92NK433AtO3YcRsTMs5WqRS7167lh1
 5zwF1+PgbWvIIifjUxW6XfhTdINFa8omBIBlEUXFdrWCbkqGX0Q9N9VpNOssJi95sUyJtxrDR
 dPTPrc38W0ANMQG6/aqZGYWZn0l5nB0i/egUZOMRzXAqI/4T8EryYj9xM9MJkWb94r2VO3gQd
 Vc93Rsm2dQIkiHkXyjFbfxNwuTUokcSd/xH9h49japuwvN4RnoLKnSs2UAy5A18gwEIZF+/KW
 txu62006A1blY3xW2tkkvIxX4gqblwz854NcN/zpAQKU
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Linux supports both the original ARMv6 level (early ARM1136) and ARMv6K
(later ARM1136, ARM1176 and ARM11mpcore).

ast2500 falls into the second categoy, being based on arm1176jzf-s.
This is enabled by default when using ARCH_MULTI_V6, so we should
not 'select CPU_V6'.

Removing this will lead to more efficient use of atomic instructions.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-aspeed/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-aspeed/Kconfig b/arch/arm/mach-aspeed/Kconfig
index a293137f5814..163931a03136 100644
--- a/arch/arm/mach-aspeed/Kconfig
+++ b/arch/arm/mach-aspeed/Kconfig
@@ -26,7 +26,6 @@ config MACH_ASPEED_G4
 config MACH_ASPEED_G5
 	bool "Aspeed SoC 5th Generation"
 	depends on ARCH_MULTI_V6
-	select CPU_V6
 	select PINCTRL_ASPEED_G5 if !CC_IS_CLANG
 	select FTTMR010_TIMER
 	help
-- 
2.20.0

