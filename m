Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D348D919FCA
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 09:00:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ys3p7ifs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8qGb27jxz3cWy
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2024 17:00:55 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ys3p7ifs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8qG129cfz3cXK
	for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 17:00:25 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1faad2f1967so2040255ad.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2024 00:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719471625; x=1720076425; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9P/6thWhyAhLlnTSORgZONADXz1PJKmrKN+CX9/Zsos=;
        b=Ys3p7ifsNrzPsBGRNS6cnO86g8rkkKErOHk3uOm4vw8QlduehRouJpPT60ed78NLJq
         w6Zn2nuuvLUrSMMt0SbsLdeWqtTOHoauzOrAwpGZ0kRqaKlgKRXMV+xNBojgIGWg+pBa
         EXsJaMFSmhS5m3HFKgO+HTRHSVJ/6oZbS8+3NcpG0IF4eS1FQQAwSbHfFQ4zdbnbdkkq
         QY90GYa/UzHfqZofxm6vw3q2Q3tSX/S5uwv+W6DmLayoAbnjgBsvr6FRmr34Emu7Wd2q
         ahl4EMTrP1EXpZqnV0D1VcBXFTN8TFBZMc6DkkpPfEuTcmW0m5BeDfR3rpGGEtzxnmia
         r5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719471625; x=1720076425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9P/6thWhyAhLlnTSORgZONADXz1PJKmrKN+CX9/Zsos=;
        b=BR1ko3+VblBRobhFldwKH8QtEmj8fkV/wzTlHBO8+ZB7PMvJxF8BhbVKO1+kwGnWCH
         zTJ216+zomC92QWPWLOdk+3kjPuNuF1wfIO4j/orcRiKPN9U0F5kaj9R9ITw++y+luze
         7Tm2vb5iAVRjDtqjiWKBbri53WBp37tegNnltwEWfjGv1s+RR+SKqITQ5TxbvGUtKAIP
         3gSsr7cQbihMYix+6kszC6qJtnl4vos6BBc0u/sLYlnFSvBDx8FXdLpK9wv7lL+RdnnT
         wNppfZAceTzKXfEPDkkPXlCsw0lNfYsi62ntgSuJyOEbKXuLOfdCbA3jxDcm0FIJIL08
         Yp5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsZ4QH5jvoPlGU/Xt0g7vgjVTXfllDygoxjHfHVcJ+GvOFxGptM+MsZDt3N2hPA+5KJErLT6weeQlMjXDFHpCZOkS2Q3577VIrdbps7A==
X-Gm-Message-State: AOJu0YxrjKrJ0qNokFv+rcmjMiixFAapaymPItpkKbUQzhMsm43x3MYP
	nnO6s+I23bMJBtoAJytVsWMw8uc6PjvO1g9ntEkt2Iz7Sp93CfDi0c8DAQ==
X-Google-Smtp-Source: AGHT+IEpk77phzTSqlAlmA5v27j5vJIbiA+vsz+SpeqBvWB618Go6G9fPBLxaOIqyfW/UwLFFfhDDw==
X-Received: by 2002:a17:903:1104:b0:1fa:97ec:3a4 with SMTP id d9443c01a7336-1fa97ec057emr42416765ad.8.1719471624571;
        Thu, 27 Jun 2024 00:00:24 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (2001-b400-e306-713d-05da-7754-dfb7-477a.emome-ip6.hinet.net. [2001:b400:e306:713d:5da:7754:dfb7:477a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1faac997ed1sm5962145ad.211.2024.06.27.00.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 00:00:24 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	amithash@meta.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/10] ARM: dts: aspeed: Harma: add VR device
Date: Thu, 27 Jun 2024 15:00:04 +0800
Message-Id: <20240627070013.2509150-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
References: <20240627070013.2509150-1-peteryin.openbmc@gmail.com>
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add isl69260, xdpe152c4 device

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406170350.zQo7bJdX-lkp@intel.com/
---
 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index d99fba321379..8fb30029e46c 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -398,6 +398,30 @@ imux28: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
+			power-monitor@61 {
+				compatible = "isil,isl69260";
+				reg = <0x61>;
+			};
+			power-monitor@62 {
+				compatible = "isil,isl69260";
+				reg = <0x62>;
+			};
+			power-monitor@63 {
+				compatible = "isil,isl69260";
+				reg = <0x63>;
+			};
+			power-monitor@64 {
+				compatible = "infineon,xdpe152c4";
+				reg = <0x64>;
+			};
+			power-monitor@66 {
+				compatible = "infineon,xdpe152c4";
+				reg = <0x66>;
+			};
+			power-monitor@68 {
+				compatible = "infineon,xdpe152c4";
+				reg = <0x68>;
+			};
 		};
 		imux29: i2c@1 {
 			#address-cells = <1>;
-- 
2.25.1

