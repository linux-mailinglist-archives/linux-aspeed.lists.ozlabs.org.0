Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DB990630E
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Jun 2024 06:21:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KSBMEN3g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W08PP6DVcz3cVS
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Jun 2024 14:21:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=KSBMEN3g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W08PH6cK0z30WX
	for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jun 2024 14:21:39 +1000 (AEST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
	id E484E2018F; Thu, 13 Jun 2024 12:21:35 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1718252495;
	bh=S+YHJgRM035nLxthI4G82gaHJgS6T+YR08kZw9KBQvs=;
	h=From:Date:Subject:To:Cc;
	b=KSBMEN3gaumaS04MngmkQj7Idqi2x305ZiqlvpkV5RiN6bOsFjMuzkuT0BixzjFdQ
	 lRfWAk44G1P29/xZqyLDMbDSOhXAw+yEV+mvgc6/bMYeHkvo0OKMMwO4sdOwmhaSTn
	 rp+RCGTY0qdfEpIN8Z42TqkRFS0zM7HyDL4/vjPnsPTkxCISS+wCJ2RHdlIGG4nRIU
	 1Hz/Qxs0p0xRVbERsUPvG2ptffaVD3Ge4GYleH9RpjnKrtGytOKrQo0e7pgyrjJsZn
	 GM5iA5shjX7ecyjl3YL1vMsEeq7t3qM2N5/8eRxk5CvCDUjAA8guqiBLaeBTO3vysI
	 UpwOdDbRdA6CA==
From: Jeremy Kerr <jk@codeconstruct.com.au>
Date: Thu, 13 Jun 2024 12:20:47 +0800
Subject: [PATCH v2] usb: gadget: aspeed_udc: fix device address
 configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240613-aspeed-udc-v2-1-29501ce9cb7a@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIAJ5zamYC/03MQQqDMBCF4avIrDuSpFWhq95DXKQzY82iRpIYW
 sS7NxUKXf4P3rdBlOAkwrXaIEh20fm5hDlVQJOdH4KOS4NR5qJardHGRYRxZULVMbGo1hCNUA5
 LkNG9DqwfSk8uJh/eh531d/0x5p/JGjWy6bp705yt0Hgjz0J+jimslGryz9quMOz7/gFjxalFr
 wAAAA==
To: Neal Liu <neal_liu@aspeedtech.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.13.0
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
Cc: linux-usb@vger.kernel.org, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

In the aspeed UDC setup, we configure the UDC hardware with the assigned
USB device address.

However, we have an off-by-one in the bitmask, so we're only setting the
lower 6 bits of the address (USB addresses being 7 bits, and the
hardware bitmask being bits 0:6).

This means that device enumeration fails if the assigned address is
greater than 64:

[  344.607255] usb 1-1: new high-speed USB device number 63 using ehci-platform
[  344.808459] usb 1-1: New USB device found, idVendor=cc00, idProduct=cc00, bcdDevice= 6.10
[  344.817684] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[  344.825671] usb 1-1: Product: Test device
[  344.831075] usb 1-1: Manufacturer: Test vendor
[  344.836335] usb 1-1: SerialNumber: 00
[  349.917181] usb 1-1: USB disconnect, device number 63
[  352.036775] usb 1-1: new high-speed USB device number 64 using ehci-platform
[  352.249432] usb 1-1: device descriptor read/all, error -71
[  352.696740] usb 1-1: new high-speed USB device number 65 using ehci-platform
[  352.909431] usb 1-1: device descriptor read/all, error -71

Use the correct mask of 0x7f (rather than 0x3f), and generate this
through the GENMASK macro, so we have numbers that correspond exactly
to the hardware register definition.

Fixes: 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver")
Cc: stable@vger.kernel.org
Reviewed-by: Neal Liu <neal_liu@aspeedtech.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
v2:
- Add Cc: stable@ tag
- v1: https://lore.kernel.org/r/20240612-aspeed-udc-v1-1-d277b553aecf@codeconstruct.com.au
---
 drivers/usb/gadget/udc/aspeed_udc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/aspeed_udc.c b/drivers/usb/gadget/udc/aspeed_udc.c
index 3916c8e2ba01..821a6ab5da56 100644
--- a/drivers/usb/gadget/udc/aspeed_udc.c
+++ b/drivers/usb/gadget/udc/aspeed_udc.c
@@ -66,8 +66,8 @@
 #define USB_UPSTREAM_EN			BIT(0)
 
 /* Main config reg */
-#define UDC_CFG_SET_ADDR(x)		((x) & 0x3f)
-#define UDC_CFG_ADDR_MASK		(0x3f)
+#define UDC_CFG_SET_ADDR(x)		((x) & UDC_CFG_ADDR_MASK)
+#define UDC_CFG_ADDR_MASK		GENMASK(6, 0)
 
 /* Interrupt ctrl & status reg */
 #define UDC_IRQ_EP_POOL_NAK		BIT(17)

---
base-commit: 32f88d65f01bf6f45476d7edbe675e44fb9e1d58
change-id: 20240611-aspeed-udc-07dcde062ccf

Best regards,
-- 
Jeremy Kerr <jk@codeconstruct.com.au>

