Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A3E29CCE3
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 02:29:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLWG53y5rzDqNm
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 12:29:49 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bQmlgGWa; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLBCQ09XnzDqQP
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 23:41:21 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id r127so2070171lff.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=p5MHF+GS//NLoxtDdJvGf+EKzs5shXRufRzejDPH6Ww=;
 b=bQmlgGWaAj6ONZe7lIbtUhAeMgidNVhcGFgIP1nEGtudEb+k4VAK6dPj15Mf+gC3v5
 XJZTewE9/lJ59NFEe4YZ2vk0WMq7fy9dWUqG8L8afW7P9zTWNGQldAsKEBrdfgSyoZJP
 X4wBuEphxxj++zNFlcOFG3/UEyTbUpPiJiE+wBm6qlvpcjTVEAUD1ATN11kmjHfRvE9y
 WG7QrQlvcgAwwwJMDUajTKtVGBX9LwVqWBNK8LQa5/chLj4kY6LxmvcvZJ4IPwtvpt8x
 9xcf4FsogsSceGLFIRd72yr4hbDBGQIXBBM0traMyIzz13Dv+ruUjhyCz0SM1hn3He1r
 SEcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=p5MHF+GS//NLoxtDdJvGf+EKzs5shXRufRzejDPH6Ww=;
 b=pabf/BZZdCmSz21UPNsuN0D4hQtQKJ2u3f1MuQNmrsVCkj0bFZuL9PF0CTqpXEK9JT
 H5jgVMTTY3or/bpXGaj1cxgTIaHwQ0onaYq9PgdQZbXlMj1pyKl1paQDtFDqtgbRcd5r
 w4OZWHBPirvKS8k5FgkJSImkR61M5aTamERdzd+3Y13d8U5gVOw09XIqHYHhhJVIrUnR
 /55gd6A4IE2/BxSuLsd4Fa5dEuNq7WiqU52xPT3Y/Ja+OoVbiSs37BusZJRKxIIxL2tQ
 FQEAQgEsk223WC7Gd6/+GukjV+TOxoXt5bmQZyXOTiYH+KeI/bdcjLkaqO6k3m5jXEe7
 ARVw==
X-Gm-Message-State: AOAM532ZcLgm3i16ep0h8kBAKUPusFXR0K6FT5xQ2yQn8vn7/fg2+rPS
 tnHxeOiYDdZ3p5NPa5ABLQE=
X-Google-Smtp-Source: ABdhPJwL7ovGKGXskH6rRkXZBnc//Bv8sl5bhQwi8/HtQ1VqxOKNaST2YV/nEhhIHFbBLWbnBKQqWw==
X-Received: by 2002:a05:6512:322d:: with SMTP id
 f13mr744638lfe.571.1603802476481; 
 Tue, 27 Oct 2020 05:41:16 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain
 (broadband-46-242-8-148.ip.moscow.rt.ru. [46.242.8.148])
 by smtp.gmail.com with ESMTPSA id e15sm49132ljj.60.2020.10.27.05.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:41:15 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH 3/3] ARM: dts: aspeed: amd-ethanolx: Enable devices for the
 iKVM functionality
Date: Tue, 27 Oct 2020 15:37:22 +0300
Message-Id: <20201027123722.2935-3-aladyshev22@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201027123722.2935-1-aladyshev22@gmail.com>
References: <20201027123722.2935-1-aladyshev22@gmail.com>
X-Mailman-Approved-At: Wed, 28 Oct 2020 12:29:33 +1100
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 aladyshev22@gmail.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, supreeth.venkatesh@amd.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Enable the USB 2.0 Virtual Hub Controller and
the Video Engine with it's reserved memory region for the implementation
of the iKVM functionality in the BMC.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 2a86bda8afd8..b93ed44eba0c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -13,6 +13,21 @@
 	memory@80000000 {
 		reg = <0x80000000 0x20000000>;
 	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		video_engine_memory: jpegbuffer {
+			size = <0x02000000>;	/* 32M */
+			alignment = <0x01000000>;
+			compatible = "shared-dma-pool";
+			reusable;
+		};
+	};
+
+
 	aliases {
 		serial0 = &uart1;
 		serial4 = &uart5;
@@ -220,5 +235,12 @@
 	};
 };
 
+&video {
+	status = "okay";
+	memory-region = <&video_engine_memory>;
+};
 
+&vhub {
+	status = "okay";
+};
 
-- 
2.17.1

