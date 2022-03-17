Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7034DD2D4
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Mar 2022 03:10:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKSD071spz30Bm
	for <lists+linux-aspeed@lfdr.de>; Fri, 18 Mar 2022 13:10:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=M4AvDjXI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033;
 helo=mail-pj1-x1033.google.com; envelope-from=singh.kuldeep87k@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=M4AvDjXI; dkim-atps=neutral
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKH175N0rz3bWj
 for <linux-aspeed@lists.ozlabs.org>; Fri, 18 Mar 2022 06:15:54 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so2553257pjb.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Mar 2022 12:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ra3lig8Mw5jgrfIYORH6OPZQGSdQZUTC0lhaPMPwJKY=;
 b=M4AvDjXI/NitZPtXNLOus/tMJ6/l+u6+pfomdfirI+wQmqSMdTDoI/O/PZPXJSj+b9
 KLDjtwGI4mJga86llA0NxD1YdZMQE23lNYkgShZQTlJpU8i4CDveEVR4f4/KavMXqX6L
 PBQTxnsS0gFUXD5pm/jtbVBQQ1ZxWOsnSYLBsPIaC5FZzZu+UheAbZZIexi70gE569ys
 X7Dhp2n/ngtAI/QXcR30cBMLEZ2YxUNwl0MsO/azrk0MDrQChZghK3wWbriiYnj5yFCi
 J0L0Z8biOyjoKGk6A7N4vTDG+Fd3W5CmxXWc3/zrU7mVJQTxM9h462oWG4sQ6AUGleKL
 x+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ra3lig8Mw5jgrfIYORH6OPZQGSdQZUTC0lhaPMPwJKY=;
 b=CyCjxWVnU2bpijRRCavOnKJ5PsNRIzrO+eOleOcZ0KHk9/7eEn38pO1ZGG1M0Hjx8b
 596DO8xxo1Suge5lw8WH2SevnseIvI8FPoidVrCHsfmTPtkez/KBLRyVIi8Wd1CbDMNW
 OXKGS1oFNDh88uCej8yBsN8k7WEhX7MYgLGLlUcTAEeXQvRDshnp1WHH+BpnEvEb0s8J
 Yxg39n2OKFHdM24NC+vxMg4ZRIoD0iijwPfQUAlh99wMj2k6FfDh6MwlMdxn216dFkdd
 rihwI7tjYmAUbm4QOINsyui2L8RxhpVWmt9yafCIVzKi4XPKHTuyTG5NOd6jdKIwxfL+
 TGxg==
X-Gm-Message-State: AOAM531jtca3UrIUDSh098CZ/u8UpV6tm/Kps02ilFJnqiAVzDZl1tYz
 G2lVGO5BWxXpFUiFSV01rII=
X-Google-Smtp-Source: ABdhPJzZrFOfTfDFR/A+MlW2V7H/O5+s8KWluMgYHWIxVUMEOBwUxz7hGpUNjliJLIqA0EyC3gBN2A==
X-Received: by 2002:a17:90a:558b:b0:1c6:6f44:a36a with SMTP id
 c11-20020a17090a558b00b001c66f44a36amr7028417pji.141.1647544551687; 
 Thu, 17 Mar 2022 12:15:51 -0700 (PDT)
Received: from localhost.localdomain ([122.161.51.18])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a056a0010cb00b004e1b76b09c0sm7623076pfu.74.2022.03.17.12.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 12:15:51 -0700 (PDT)
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
To: Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 3/3] ARM: dts: aspeed: Remove arch timer clocks property
Date: Fri, 18 Mar 2022 00:45:26 +0530
Message-Id: <20220317191527.96237-4-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317191527.96237-1-singh.kuldeep87k@gmail.com>
References: <20220317191527.96237-1-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 18 Mar 2022 12:56:13 +1100
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Arch timer either require clock-frequency property or doesn't need to
specify clock at all in DT. In general, frequency can be determined
internally and in case of brokern firmwares, need to extend
clock-frequency to pass info to driver.

Aspeed BMC is the platform which defines clocks property, an invalid
entry which can be safely removed.

Moreover, clocks also matches incorrectly with the regex pattern.
Remove this entry altogether to fix it.
'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
---
 arch/arm/boot/dts/aspeed-g6.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g6.dtsi b/arch/arm/boot/dts/aspeed-g6.dtsi
index c32e87fad4dc..d5ef9aceb632 100644
--- a/arch/arm/boot/dts/aspeed-g6.dtsi
+++ b/arch/arm/boot/dts/aspeed-g6.dtsi
@@ -64,7 +64,6 @@ timer {
 			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>,
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_LOW)>;
-		clocks = <&syscon ASPEED_CLK_HPLL>;
 		arm,cpu-registers-not-fw-configured;
 		always-on;
 	};
-- 
2.25.1

