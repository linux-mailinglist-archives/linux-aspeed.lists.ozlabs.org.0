Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 828244825FA
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Dec 2021 23:02:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JQfHr1bncz303Z
	for <lists+linux-aspeed@lfdr.de>; Sat,  1 Jan 2022 09:02:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=G2bDFBSv;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f;
 helo=mail-ed1-x52f.google.com; envelope-from=petr.vorel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=G2bDFBSv; dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JQfHm14nMz2yPV
 for <linux-aspeed@lists.ozlabs.org>; Sat,  1 Jan 2022 09:01:54 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id z9so42592838edm.10
 for <linux-aspeed@lists.ozlabs.org>; Fri, 31 Dec 2021 14:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j+4iMBSwaeopLtgG6AD/QBPgN5+SLATiAH2c5g7+e24=;
 b=G2bDFBSvac4aYrO4gC5UJd1XVxp71KFK/nIMYBjqTDQH193yh3p3qhKaFk/1ZJbH3x
 GYOYEQOU6TiC7YNk6sZ3kq0NtnnN6wxQ6sK9DVsyVhkqdvRBdzihLpBUXfIqOwPOukg/
 Qdx2Zo5DFLsoC/KllvN4vuoe/NRhI/ppWQSCtsFrbLAAgfoXy9npj5ae1DGtzypCNVUY
 B3KbOACCRgXm6LdHjZ3eSfdLMwAr9D1+lhlfOtJnokWIqXexT+y43c2ILK77ScU5BUfd
 hBow5cSLP8P4hD1Ch08A1t2dPow4PoO/e4xdIpfgSZgEbriMmkfnf+QB+6ALbH9KISmv
 rLXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j+4iMBSwaeopLtgG6AD/QBPgN5+SLATiAH2c5g7+e24=;
 b=o2d5O3Mdri+g2ZSUjKPoYTjIVMkApGFvCLaPsBbyrXblxYelkck539yY36wg02R94e
 CT+3cncDxErHikMG08KUK7YyYotf/rc/YwPusDHkkSCEqdLbCcKy2DzPY3IhkNVe+yth
 xS3lxnZtGb04XBGp5PFi6EZxqLbbyNcHD0xiX8jZV2/1I+0akO/sA+kkSs7XA498+w94
 6+G/ungkAwYUMdtLjQd3iVHoozkvzc/eY3JZyHq1HMj0eXXci27ZPGdIG0AHmIvfcgwn
 bnckhOeCaqnVpm9IL/m/k8VcuVbGpC2oGztSX/Q4iRGuUbsyamshmnhrMvrWjqfhDaA3
 qH3g==
X-Gm-Message-State: AOAM5313ViGYrLzzom0XX1ZqblFKpgzzCYBHKxVIJ6nQofdvRV1ZfJ0F
 iG5f90K3fW8ijR+xu+H5VJ8qmnDIvxM=
X-Google-Smtp-Source: ABdhPJxWQE/Iogwch+ZvNF4Cv1kzo5f1LtJ8UsIRYyuYT37E6T6lITIMvng/QDXPw8kBgGwuMgrlnw==
X-Received: by 2002:a05:6402:280c:: with SMTP id
 h12mr23382158ede.138.1640988106512; 
 Fri, 31 Dec 2021 14:01:46 -0800 (PST)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id sh11sm8793709ejc.17.2021.12.31.14.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 14:01:46 -0800 (PST)
From: Petr Vorel <petr.vorel@gmail.com>
To: linux-aspeed@lists.ozlabs.org
Subject: [PATCH 1/1] arm: dts: aspeed: Fix typo
Date: Fri, 31 Dec 2021 23:01:38 +0100
Message-Id: <20211231220138.119747-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Fixes: 25337c735414 ("ARM: dts: aspeed: Add Inventec Lanyang BMC")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
index c0847636f20b..e72e8ef5bff2 100644
--- a/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts
@@ -52,12 +52,12 @@ hdd_fault {
 			gpios = <&gpio ASPEED_GPIO(B, 3) GPIO_ACTIVE_HIGH>;
 		};
 		bmc_err {
-			lable = "BMC_fault";
+			label = "BMC_fault";
 			gpios = <&gpio ASPEED_GPIO(H, 6) GPIO_ACTIVE_HIGH>;
 		};
 
 		sys_err {
-			lable = "Sys_fault";
+			label = "Sys_fault";
 			gpios = <&gpio ASPEED_GPIO(H, 7) GPIO_ACTIVE_HIGH>;
 		};
 	};
-- 
2.34.1

