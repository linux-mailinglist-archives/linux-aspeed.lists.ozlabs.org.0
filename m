Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D6BF888F
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 07:30:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ByXW3kFhzDrNW
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 17:30:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="QCkdi+ZI"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ByWl463qzF3x0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 17:29:23 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id n13so12650274pff.1
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Nov 2019 22:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iAbZBF5j8Y1P7hUcJsCBw21+LuTR3/8WczhaBBqC5k0=;
 b=QCkdi+ZISodfzvbdFETIEqUgSSp6K0sw8FsoUS2p06yLZlg3HX2TAWvE8uWBBqsvrv
 ASCgiJ59D8K8DH6BhOUYcVObKEKOFN776oxa2/TNZml45Sb/ugZlzQXFyDATD/JWfWdn
 rN3/kQTO2RbzY6xSFCvbeRWBo7D7z9rpqqXbb2mP9zu2m62gTmugkifM2z9DVjy/SmVL
 jJaSWWNalkw27bfuYLft3TyMSmc7hT0inBLxdJ029uKtzi5k9P+rCAhaQ2q9HNUTsV6G
 f/0KF7+qFYUrzHQih5hNhcLfDYTZDcahQPSUHtsPcWbHYN25NE2teKLoBzENYmrIHmjL
 CbYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=iAbZBF5j8Y1P7hUcJsCBw21+LuTR3/8WczhaBBqC5k0=;
 b=oMQtPVayMBsfjF5FHBK1RWjPwJNxbDIlcyi9jkebG7TjeUVhozJ/XOYyPKolPYUvCO
 JQu6zJx1ga9b2h+4rC5y5RiJfv8C1DahZCBNKbdYXKTg0L5rwfYV4mkXLorOZmh/uAHM
 WnRy2AUTt9Ra7P2/Z/ErVe/GFSQW8yDjT5357lg0SnVUDMs+IFOcE1WoDG1gXCktCZZM
 WIMEn6UzmE9rTkVyzK//j3mosMPGsrk4boy4H1PN9zrg9lonCFSpGkjmrG+TelHS2OWH
 iC8zMQUCVAHAY2md5szflLkWrgva+CgLXJbXm4Q0OwpBmFDb47CNoeQ5csZi3E+QkHQ2
 g0ww==
X-Gm-Message-State: APjAAAVnx5iwNXALxS2x3Vo1mUenjIvbjy3rjLwHTq3OXJ7Nz1OBTxMT
 Ngs/ksdkehEwt2oLEHxw97I=
X-Google-Smtp-Source: APXvYqzcFzXk2d0cG3NG6RVGa0b1UIviUUiS2uyDVvJEKFVJFFpYoRq7HOyZXxUgKN6zMs//YiOn+w==
X-Received: by 2002:a65:624e:: with SMTP id q14mr32915005pgv.277.1573540161457; 
 Mon, 11 Nov 2019 22:29:21 -0800 (PST)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id x20sm18573707pfa.186.2019.11.11.22.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 22:29:20 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 5/5] ARM: config: multi_v5: ASPEED SDHCI, SGPIO
Date: Tue, 12 Nov 2019 16:58:57 +1030
Message-Id: <20191112062857.32638-6-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112062857.32638-1-joel@jms.id.au>
References: <20191112062857.32638-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 Arnd Bergmann <arnd@arndb.de>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable drivers used by the ASPEED AST2400 SoC so the multi v5 defconfig
can run on those boards.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/multi_v5_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index bd018873e47a..56315e1f81ff 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -165,6 +165,7 @@ CONFIG_SPI_ATMEL=y
 CONFIG_SPI_IMX=y
 CONFIG_SPI_ORION=y
 CONFIG_GPIO_ASPEED=m
+CONFIG_GPIO_ASPEED_SGPIO=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_GPIO=y
 CONFIG_POWER_RESET_QNAP=y
@@ -241,6 +242,9 @@ CONFIG_USB_ASPEED_VHUB=m
 CONFIG_USB_CONFIGFS=m
 CONFIG_MMC=y
 CONFIG_SDIO_UART=y
+CONFIG_MMC_SDHCI=m
+CONFIG_MMC_SDHCI_PLTFM=m
+CONFIG_MMC_SDHCI_OF_ASPEED=m
 CONFIG_MMC_ATMELMCI=y
 CONFIG_MMC_MVSDIO=y
 CONFIG_NEW_LEDS=y
-- 
2.24.0

