Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 416CA971C7
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 07:56:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Cxk90vHQzDr2q
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 15:56:33 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gRuFZtDY"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cxjw0JDJzDr5V
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2019 15:56:20 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id z3so724832pln.6
 for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2019 22:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kVMeqsg/mfUvkErCbhFnFtOVad83MIZWTR0g/QLKhHg=;
 b=gRuFZtDYE6HaBYpsqgwODQ5NYhb1E049C4CJPD6ptRyASE/L1glTUH7bxw+GO/6EEg
 LgJYH1de4KJdYzTlcW3231lYYamXUxjEsP+/agV/DShX+MaHAoOdTiMvxP8GD5mzsPtQ
 4VllDrbGELoCByPwRR/auQv+UwUSB0QT5xQfBFsKikylin/F0djpNzmzSZitfGPN7ZCZ
 YC/aObf4medqKPVSPfR9B+pNujvRW1z3NYykHXwajvpohzUBMbqaF1NVcoR8c/LqoIiq
 k45t4zHmxKCh58MfySNql6iervFLLVNFoNV5PkYKQ6Ntgp6DeYwhNAjYhw1ZupTib+mx
 98bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=kVMeqsg/mfUvkErCbhFnFtOVad83MIZWTR0g/QLKhHg=;
 b=XbulZhT4K/Eb7nKD7OntbzXyf6PdjJEU7mZDZlDhHcUZboTh1ObDkJloCrKJnCyoOi
 xz7+IWSDjOHyrsLPDrn9hKnAgIwwqc2GE2oCi8RbORO33AIioobu82UyQzRIyS9y/lnR
 6LTCeUo+EhDh9snYR5QeJwp9ar581AhSjwG+mIl9lMs8Z7UJs7Ue4QvfUfgxIgGChXMB
 JV0rsXcybFz9LS1mG9lQlMdRX8hhceitgYWOicBBLNAyFIBCnYn/HuOf3Yp85nqXI9X+
 PhRDHvaTIcs2t8PoM+BvaUqTqgzjXRYgY4WM53hdinyeODZunWDfoV8EUEwI55UkaCD9
 N5wg==
X-Gm-Message-State: APjAAAURbv7XT7+tmOLtXiPOoumMqW6iv4p8lVTgCWfaknoOM3T1aJVd
 7c/LsZp38Bx2Nt04sraXEvM=
X-Google-Smtp-Source: APXvYqwbrMpfNmsuAWcz4Hd/RXIbJ08v7L7s3HTxAg5HMw3qLUl5LopPuCkywBUbJMhNt/nfh7X96Q==
X-Received: by 2002:a17:902:bb85:: with SMTP id
 m5mr8924448pls.322.1566366978155; 
 Tue, 20 Aug 2019 22:56:18 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id m9sm26568254pfh.84.2019.08.20.22.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 22:56:17 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
Subject: [PATCH 6/7] ARM: configs: multi_v7: Add ASPEED G6
Date: Wed, 21 Aug 2019 15:25:29 +0930
Message-Id: <20190821055530.8720-7-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190821055530.8720-1-joel@jms.id.au>
References: <20190821055530.8720-1-joel@jms.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This adds the ASPEED AST2600 system and associated ASPEED devices so we
get build coverage.

The changes to the UART configuration to ensure the default console
(UART5) works.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/multi_v7_defconfig | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 3dc02a5e7672..ebb00321b1eb 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -9,6 +9,8 @@ CONFIG_ARCH_VIRT=y
 CONFIG_ARCH_ALPINE=y
 CONFIG_ARCH_ARTPEC=y
 CONFIG_MACH_ARTPEC6=y
+CONFIG_ARCH_ASPEED=y
+CONFIG_MACH_ASPEED_G6=y
 CONFIG_ARCH_AT91=y
 CONFIG_SOC_SAMA5D2=y
 CONFIG_SOC_SAMA5D3=y
@@ -200,6 +202,7 @@ CONFIG_MTD_NAND_VF610_NFC=y
 CONFIG_MTD_NAND_DAVINCI=y
 CONFIG_MTD_NAND_STM32_FMC2=y
 CONFIG_MTD_SPI_NOR=y
+CONFIG_SPI_ASPEED_SMC=m
 CONFIG_MTD_UBI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
@@ -306,7 +309,11 @@ CONFIG_INPUT_STPMIC1_ONKEY=y
 CONFIG_SERIO_AMBAKMI=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=5
+CONFIG_SERIAL_8250_RUNTIME_UARTS=5
 CONFIG_SERIAL_8250_EXTENDED=y
+CONFIG_SERIAL_8250_MANY_PORTS=y
+CONFIG_SERIAL_8250_ASPEED_VUART=m
 CONFIG_SERIAL_8250_SHARE_IRQ=y
 CONFIG_SERIAL_8250_BCM2835AUX=y
 CONFIG_SERIAL_8250_DW=y
@@ -351,6 +358,8 @@ CONFIG_SERIAL_STM32=y
 CONFIG_SERIAL_STM32_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_VIRTIO_CONSOLE=y
+CONFIG_ASPEED_KCS_IPMI_BMC=m
+CONFIG_ASPEED_BT_IPMI_BMC=m
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_ST=y
 CONFIG_TCG_TPM=m
@@ -360,6 +369,7 @@ CONFIG_I2C_ARB_GPIO_CHALLENGE=m
 CONFIG_I2C_MUX_PCA954x=y
 CONFIG_I2C_MUX_PINCTRL=y
 CONFIG_I2C_DEMUX_PINCTRL=y
+CONFIG_I2C_ASPEED=m
 CONFIG_I2C_AT91=m
 CONFIG_I2C_BCM2835=y
 CONFIG_I2C_CADENCE=y
@@ -464,6 +474,7 @@ CONFIG_CHARGER_MAX77693=m
 CONFIG_CHARGER_MAX8997=m
 CONFIG_CHARGER_MAX8998=m
 CONFIG_CHARGER_TPS65090=y
+CONFIG_SENSORS_ASPEED=m
 CONFIG_SENSORS_IIO_HWMON=y
 CONFIG_SENSORS_LM90=y
 CONFIG_SENSORS_LM95245=y
@@ -594,6 +605,7 @@ CONFIG_VIDEO_V4L2_SUBDEV_API=y
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
+CONFIG_VIDEO_ASPEED=m
 CONFIG_VIDEO_STM32_DCMI=m
 CONFIG_VIDEO_SAMSUNG_EXYNOS4_IS=m
 CONFIG_VIDEO_S5P_FIMC=m
@@ -663,6 +675,7 @@ CONFIG_DRM_MXSFB=m
 CONFIG_DRM_PL111=m
 CONFIG_DRM_LIMA=m
 CONFIG_DRM_PANFROST=m
+CONFIG_DRM_ASPEED_GFX=m
 CONFIG_FB_EFI=y
 CONFIG_FB_WM8505=y
 CONFIG_FB_SH_MOBILE_LCDC=y
@@ -762,6 +775,7 @@ CONFIG_USB_MXS_PHY=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_FSL_USB2=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
+CONFIG_USB_ASPEED_VHUB=m
 CONFIG_USB_CONFIGFS=m
 CONFIG_USB_CONFIGFS_SERIAL=y
 CONFIG_USB_CONFIGFS_ACM=y
@@ -870,6 +884,7 @@ CONFIG_RTC_DRV_TEGRA=y
 CONFIG_RTC_DRV_ST_LPC=y
 CONFIG_RTC_DRV_STM32=y
 CONFIG_RTC_DRV_CPCAP=m
+CONFIG_RTC_DRV_ASPEED=m
 CONFIG_DMADEVICES=y
 CONFIG_AT_HDMAC=y
 CONFIG_AT_XDMAC=y
@@ -920,6 +935,9 @@ CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_REMOTEPROC=m
 CONFIG_ST_REMOTEPROC=m
 CONFIG_RPMSG_VIRTIO=m
+CONFIG_ASPEED_LPC_CTRL=m
+CONFIG_ASPEED_LPC_SNOOP=m
+CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_RASPBERRYPI_POWER=y
 CONFIG_QCOM_GSBI=y
 CONFIG_QCOM_PM=y
@@ -952,6 +970,7 @@ CONFIG_ARM_TEGRA_DEVFREQ=m
 CONFIG_TI_AEMIF=y
 CONFIG_IIO=y
 CONFIG_IIO_SW_TRIGGER=y
+CONFIG_ASPEED_ADC=m
 CONFIG_AT91_ADC=m
 CONFIG_AT91_SAMA5D2_ADC=m
 CONFIG_BERLIN2_ADC=m
-- 
2.23.0.rc1

