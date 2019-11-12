Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D51B4F8883
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 07:29:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ByX01S8RzF2FN
	for <lists+linux-aspeed@lfdr.de>; Tue, 12 Nov 2019 17:29:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sNg7r9w1"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ByWX6YmczF3wL
 for <linux-aspeed@lists.ozlabs.org>; Tue, 12 Nov 2019 17:29:12 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id s10so8955377plp.2
 for <linux-aspeed@lists.ozlabs.org>; Mon, 11 Nov 2019 22:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tqvyiXnH8UkGAdNwTCxS5w810LeQOP2gbMH2CyilQ6I=;
 b=sNg7r9w1gjY/yePcTrErLI70UhMrPHWOT7T7vwywmSulnjSxVUhPqT4V6uNO60mJ3e
 vAqPUK86J7LpHWSSAec1Aj7oHxSQND4x85+2HKWOSsbcDXHsJeCRJ/+SwvJh9ApE0/2R
 oqosqKgHP4Y+SJNuS/SJDByOKQObbHkgA2Z35Ivgi12N+lHAxF7BXFaS47UX1n9uP1A/
 6t+l+FTDRe0E6JvR+sLSYn3w+mkgxmB53tcUVm7NWgh0soKWFsnKymybUfw87pgC63et
 0zUQ+WbEA4kxKQswnUMXNeAkS/Exa1oXrtSA2i7NDK/yApogDwgzZI8jiVlO1U4Im+WM
 JseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tqvyiXnH8UkGAdNwTCxS5w810LeQOP2gbMH2CyilQ6I=;
 b=ALT8wusvclLE6dG3sBMJH4ZmDq19ILEnvuR1RCLDEXTIRQ1Hmu3B73FyZvZs3DFjDm
 +VwmXmDt75Pf+7JSLtf3ZFGN937gBrNYx0X0mEb+hTfrgK+dZaxXNvgPRdPkcMZk9H5t
 LzjKaLaATvhMNHfw83FaaN4Sy3rRS2o4aF5BdpM/dJcdrM5RjKv+3WOVDIcAVtMr04T9
 PePnfxHv0dxODb11+2ye1tMd27Z1DcPU2ucRXDiVn+8UQ5QRdnfQFlGjDXgoqJ0Tt+ty
 VHF1kfSIEJyWBjMIjwzufaQRm0L/4wcVwhImk6ykWDUgBSLFfe7wO+e1LOMSAWMNnNuP
 R/Yg==
X-Gm-Message-State: APjAAAWKg9l1SXuVHFuBvaZWgK6UGtDZVVoNMKhepHxk+WCOdZfUcW63
 aRvEZNulVCTUOc7vgFYh98M=
X-Google-Smtp-Source: APXvYqyoe7rJ2+5VdBzuA8NOl1+uIGJMl8T9jnyZ98v4unhW9BZhkXMF/83oVCBX4zEwp/Hfk7TOfA==
X-Received: by 2002:a17:902:b584:: with SMTP id
 a4mr18470219pls.246.1573540149128; 
 Mon, 11 Nov 2019 22:29:09 -0800 (PST)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id x20sm18573707pfa.186.2019.11.11.22.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 22:29:08 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/5] ARM: config: aspeed-g5: Enable 8250_DW quirks
Date: Tue, 12 Nov 2019 16:58:53 +1030
Message-Id: <20191112062857.32638-2-joel@jms.id.au>
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

This driver option is used by the AST2600 A0 boards to work around a
hardware issue.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/arm/configs/aspeed_g5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index 597536cc9573..b87508c7056c 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -139,6 +139,7 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=6
 CONFIG_SERIAL_8250_EXTENDED=y
 CONFIG_SERIAL_8250_ASPEED_VUART=y
 CONFIG_SERIAL_8250_SHARE_IRQ=y
+CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_ASPEED_KCS_IPMI_BMC=y
 CONFIG_ASPEED_BT_IPMI_BMC=y
-- 
2.24.0

