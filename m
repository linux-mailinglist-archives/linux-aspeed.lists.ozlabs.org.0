Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B638B29CCE2
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 02:29:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLWFx5YZyzDqRp
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Oct 2020 12:29:41 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::241;
 helo=mail-lj1-x241.google.com; envelope-from=aladyshev22@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NFXCg+zs; dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLBCP6TN7zDqQ1
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 23:41:21 +1100 (AEDT)
Received: by mail-lj1-x241.google.com with SMTP id 2so1509034ljj.13
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Oct 2020 05:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZlE8y81IS7pCFhqYuFCDF3LrzBymS6x7k4Q6CBmO9rI=;
 b=NFXCg+zsjIOZrdGi7v95xzt4Ur/C4WtTPpKDCrsAB6GFjx5WVo5AdeIIOva7txkQR6
 fHzAlnHmAANNRG4r0W0YfYV1wmI+lrxlmvG5+TicNZBd3ytkUY7S3Wbvd5LT+Y8vukgT
 EvH5LxV7hgp0lqmHDoTHD0fYfkcs8ljo+rB88cO2DtsnIOABgPwXJNRo3ysIJJ+sUw5o
 W7/sYNzugo8LpyIzInVx2Bp8CZENRUM5hu4+mdLTdOtQCJOXjZMLbEXRx89YbUMFUaZV
 mgHsN1PQOnY6RXpLYnjL1HmmTD9L3362ZEWRKk/xQXsY/HC0Wy+kqvRIvELyefdBnUTR
 V7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZlE8y81IS7pCFhqYuFCDF3LrzBymS6x7k4Q6CBmO9rI=;
 b=nCdV9wbFgnE+5s4rlw1HHvgiMqRHzyRH+kVyYijbaI8PBzoE11wP+cCbGtkdHvwBUn
 FfvAFZpbb6IIK0CU2Bxl/Lw7zytaSK3Z8ebqb29fi5zZNVOCBPh0/YW6JC2Eq7ozMDJ9
 rkt4ryhWOxyF7Zo/zARyLxrsefwTQmg/rUnCUkKiN06IjNNQKij2oc9X7lQFd8EnP+gX
 efKBXGih0TLvrz/s00NfrrQEkyE75FiSno4UJx5FbSPsdeAnoAJpDQTpMtbA5IVNf+fd
 VsGr+7f6yk2dE+ORFRPPxXI+RE6Akj0vpsQZfiE/jA4RbAAhatggwU0lv6rDxMls/ZJL
 8iVA==
X-Gm-Message-State: AOAM531jQ2o1hA0GruV/UOwVLSer0KUsOuHDZAz2VlV339n0QoxweGSv
 W3x9qXDExJ+iAot84cRLjak=
X-Google-Smtp-Source: ABdhPJyAQtoQD4/oapmYyvgaUmbHlXvjVu2e0fO1sRFFnXAVlKXjbkmEP0S2eZ18/uUL8NTylkQ8VQ==
X-Received: by 2002:a2e:9dcd:: with SMTP id x13mr968561ljj.422.1603802473866; 
 Tue, 27 Oct 2020 05:41:13 -0700 (PDT)
Received: from DESKTOP-GSFPEC9.localdomain
 (broadband-46-242-8-148.ip.moscow.rt.ru. [46.242.8.148])
 by smtp.gmail.com with ESMTPSA id e15sm49132ljj.60.2020.10.27.05.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 05:41:13 -0700 (PDT)
From: Konstantin Aladyshev <aladyshev22@gmail.com>
To: 
Subject: [PATCH 2/3] ARM: dts: aspeed: amd-ethanolx: Enable KCS channel 3
Date: Tue, 27 Oct 2020 15:37:21 +0300
Message-Id: <20201027123722.2935-2-aladyshev22@gmail.com>
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

The KCS interface on the LPC channel 3 in the controller
is used for the in-band BMC<->BIOS IPMI communication.
0xCA2 is a default host CPU LPC IO address for this
interface.

Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
index 89ddc3847222..2a86bda8afd8 100644
--- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
@@ -147,6 +147,11 @@
 	aspeed,lpc-io-reg = <0x62>;
 };
 
+&kcs3 {
+	status = "okay";
+	aspeed,lpc-io-reg = <0xCA2>;
+};
+
 &kcs4 {
 	status = "okay";
 	aspeed,lpc-io-reg = <0x97DE>;
-- 
2.17.1

