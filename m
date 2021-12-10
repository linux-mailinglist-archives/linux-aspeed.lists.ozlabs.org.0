Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D5446FDDB
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Dec 2021 10:35:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9Qjn5dHSz3c6Y
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Dec 2021 20:35:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=kX3Ata2t;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20210112.gappssmtp.com
 header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=kX3Ata2t; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9Qjf4SlBz3bfl
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Dec 2021 20:34:58 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id u80so7955160pfc.9
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Dec 2021 01:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4TT1p+eLjRJsZY0SbZkrxkKX/qmSCca7EegSbohNmfE=;
 b=kX3Ata2tiIgIpyUVnssNPBLENyrUyHmdPqkXVb6XeZ5Hi1bBVilkWgZ5Ir/b6ETK7Z
 KU22LrwwnwxXwL8wVp+Yn5rp+mdJdyoY4HROY1bV8bEENHSeHPbIEyP5DN0daNYIcxAx
 3p9C2FmPUi3+WK0zNdMZrIchoYZjA0ydaVwYnToiXTDDUEzzGhZmCSPjfkPUc30Kz0sy
 tYSHgPCuMOAX6YHMCvFoUYSpzHMUytnp+1bkhC/4ipmpF4Kc6Y1mpdxp+uDNJyypEJFM
 QrVmI47fXDpIsLa7gLvmDDPPq81K8g9l7ixU0KBLP9PdO9qAOdE0qnnJxeHZhjiekv/e
 U2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4TT1p+eLjRJsZY0SbZkrxkKX/qmSCca7EegSbohNmfE=;
 b=tAh5zvPBQAgvpY+6z9ILsHq2kBjvqqlBOkIM+KTPaWzqh/fmqkG+TyVxa3HU8xPCq4
 2EMhBBH4VU/+UWC4cwquMafP38mqhK/HTeksy+78w6DTRyYRLUzxYA9v0J9TfJncECJu
 kDWs8jAGTRwzElnO40q3O7WZbcpmoKGcnGmWqhHXdO+s4AlgRZx1LnJQbb4ZirnQ6nvq
 iiWI72JDNNgG58WaXd/CJiMutTNJX8HOvx5kEVKXifwxM2vREEtA9yDmGCj6I4i8pjvk
 3tTIdgM1N2vXNE9aA24Yy2oKsqn4QPbvROPj2GpXJJpaSkl1p/T5ZdjQBrEhSw16il1A
 O8bQ==
X-Gm-Message-State: AOAM531thqfvMueV/Yq0aFW7ienNPvTo0BYW84YQmECFX89h7Pi62Mq6
 HFqfuvOTclq1oSzKJoYQnB8SVg==
X-Google-Smtp-Source: ABdhPJwf44o2Gfvevvq0zV3kXEXCt56jqrnYE05lAdKFp0o7N7jhEL805abVwQDsoz8TgvJyrPjoTw==
X-Received: by 2002:a63:1f16:: with SMTP id f22mr27539411pgf.259.1639128895335; 
 Fri, 10 Dec 2021 01:34:55 -0800 (PST)
Received: from localhost ([221.194.138.194])
 by smtp.gmail.com with ESMTPSA id t131sm1969905pgb.31.2021.12.10.01.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 01:34:54 -0800 (PST)
From: Lei YU <yulei.sh@bytedance.com>
To: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 openbmc <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
Subject: [PATCH] ARM: dts: Add openbmc-flash-layout-64-alt.dtsi
Date: Fri, 10 Dec 2021 17:34:43 +0800
Message-Id: <20211210093443.2140557-1-yulei.sh@bytedance.com>
X-Mailer: git-send-email 2.25.1
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
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Add openbmc-flash-layout-64-alt.dtsi to describe the partitions of the
secondary flash for OpenBMC's 64M static layout.
The layout is the same as openbmc-flash-layout-64.dtsi and the labels
are prepended with "alt-" for the partitions.

Signed-off-by: Lei YU <yulei.sh@bytedance.com>
---
 .../boot/dts/openbmc-flash-layout-64-alt.dtsi | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 arch/arm/boot/dts/openbmc-flash-layout-64-alt.dtsi

diff --git a/arch/arm/boot/dts/openbmc-flash-layout-64-alt.dtsi b/arch/arm/boot/dts/openbmc-flash-layout-64-alt.dtsi
new file mode 100644
index 000000000000..650525867561
--- /dev/null
+++ b/arch/arm/boot/dts/openbmc-flash-layout-64-alt.dtsi
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2020 Bytedance.
+ */
+
+partitions {
+	compatible = "fixed-partitions";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	u-boot@0 {
+		reg = <0x0 0xe0000>; // 896KB
+		label = "alt-u-boot";
+	};
+
+	u-boot-env@e0000 {
+		reg = <0xe0000 0x20000>; // 128KB
+		label = "alt-u-boot-env";
+	};
+
+	kernel@100000 {
+		reg = <0x100000 0x900000>; // 9MB
+		label = "alt-kernel";
+	};
+
+	rofs@a00000 {
+		reg = <0xa00000 0x2000000>; // 32MB
+		label = "alt-rofs";
+	};
+
+	rwfs@6000000 {
+		reg = <0x2a00000 0x1600000>; // 22MB
+		label = "alt-rwfs";
+	};
+};
-- 
2.25.1

