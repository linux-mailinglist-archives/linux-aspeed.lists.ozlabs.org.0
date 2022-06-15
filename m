Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E85C254D1E0
	for <lists+linux-aspeed@lfdr.de>; Wed, 15 Jun 2022 21:45:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNbP95mNzz3bx3
	for <lists+linux-aspeed@lfdr.de>; Thu, 16 Jun 2022 05:45:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jFT/VeSc;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jFT/VeSc;
	dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNbP14RZKz3bmc
	for <linux-aspeed@lists.ozlabs.org>; Thu, 16 Jun 2022 05:44:52 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id gl15so25259975ejb.4
        for <linux-aspeed@lists.ozlabs.org>; Wed, 15 Jun 2022 12:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=767OJrCK8HUadii808hVEy3GxcnvixklGPCO6V3YD5M=;
        b=jFT/VeSc63iFgMPMb2xRcBbUCqXUnEZl1E1MVx1Yd2xAmk3ax4Uy65On/y29eZkoe2
         EPvPLMkZIFEBJbO/DrmTsslXpsOfH14CWV/xGigqff7/K3B/BKmC5+61MIvtfT+WZpjS
         RMqvC0cMMqe3uUD7OFBaas6cXGWaO+EzMk6KMymXcRzGsE2Ww5xjysjW4+PrZDjsV9tO
         FyodoLXWhR4ioUoNG6krEdVinHpphmZO+IZVKrD8eX7Le1gfbzgMifUy58g6drBSSZ2S
         x61qQcs/hRho1FhiO1lqm+d0Zm+1hEgLk1/ro/pRLJUSHwdfNL+b8dGXulEQO0kLlMeF
         JTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=767OJrCK8HUadii808hVEy3GxcnvixklGPCO6V3YD5M=;
        b=bCl58gGVB3maDBIZfcfxmPXnE6LDtldH9Covp+IHd0kwkJUTOQxGSP0O8jrbU8ftu5
         6JYkQ+LpU2Kw5j2zBEHklh8GY9TTXJVJQkCxaV6XEQm36MymncLrE6nfWKOushB3qTTf
         f1L78BD/NtuDAn1U1UkxtSpMs4fwpcHZ7zLpyFxY3rdizcH9w9thwDBRIXS2R2K+13/J
         pcsTazz7VYzySWjyId9EBAiQ7GpKEYoxCsIcCXsijKuQtbRmOQpKWB8BoHX8gdy0ab0c
         PdDUZnJwOHxAzuJTewXUqQtgY4Un7yHT0PFu5q79JuLXKldTam38FYZBthmh2BBdphzI
         uuTQ==
X-Gm-Message-State: AJIora/nIu9xxC37SDX/bmWPi7heFeHs8N3r9qBfwiKN0KQ2no2BmSU7
	/3vSOcHGMTzqdyzUnbnDqKs=
X-Google-Smtp-Source: AGRyM1sgGqJHUeVw3u3W7rE3sqf5Kp8zpWdfvFHOMgDNOhP8CojDYKciFvgC5O7XXJFBkGcWqg0OLw==
X-Received: by 2002:a17:907:c71b:b0:718:d0a2:a447 with SMTP id ty27-20020a170907c71b00b00718d0a2a447mr1266043ejc.157.1655322284933;
        Wed, 15 Jun 2022 12:44:44 -0700 (PDT)
Received: from felia.fritz.box (200116b826878200b4eabc3163d51ca4.dip.versatel-1u1.de. [2001:16b8:2687:8200:b4ea:bc31:63d5:1ca4])
        by smtp.gmail.com with ESMTPSA id i24-20020a05640200d800b0042dcac2afc6sm29565edu.72.2022.06.15.12.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 12:44:44 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Neal Liu <neal_liu@aspeedtech.com>,
	linux-aspeed@lists.ozlabs.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Repair file entry in ASPEED USB UDC DRIVER
Date: Wed, 15 Jun 2022 21:44:09 +0200
Message-Id: <20220615194409.11875-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Commit 055276c13205 ("usb: gadget: add Aspeed ast2600 udc driver") adds
the section ASPEED USB UDC DRIVER with a file entry to aspeed,udc.yaml,
but then, commit 0dde9a46a2cf ("dt-bindings: usb: add documentation for
aspeed udc") actually adds a device tree binding aspeed,ast2600-udc.yaml.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair the reference to the actually added file in ASPEED USB UDC DRIVER.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Neal, please ack.
Greg, please pick this minor non-urgent clean-up patch in your usb-next tree.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d9c3576b082f..8830d1adb23b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3144,7 +3144,7 @@ ASPEED USB UDC DRIVER
 M:	Neal Liu <neal_liu@aspeedtech.com>
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/usb/aspeed,udc.yaml
+F:	Documentation/devicetree/bindings/usb/aspeed,ast2600-udc.yaml
 F:	drivers/usb/gadget/udc/aspeed_udc.c
 
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
-- 
2.17.1

