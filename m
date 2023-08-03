Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 043B076F5ED
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Aug 2023 01:03:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fhxBpCO3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RH4CT2l44z3cNY
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Aug 2023 09:03:49 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=fhxBpCO3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=rentao.bupt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RH4CC42SFz2ydR
	for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Aug 2023 09:03:35 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-686f8614ce5so1364795b3a.3
        for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Aug 2023 16:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691103812; x=1691708612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqQhR/5Zg/iUnJ10XmwJefyLz1QkYmSYn+GFkwwlYbc=;
        b=fhxBpCO3SQTUHyytwbtWYj1SDwLbSUkacsfS7IFhv4GS4d24YEZB54L6kSZMpRxSU4
         SOHzyVUgKVmC6DSkb9016yUKAR8ca5RVgyUjvi0UPlUTBty3e+QmQapVf1VV5ZDZSdQH
         dKtRBX+lK71xW4/lL/sIVoJMs/JOgz2N2NVQ+3P9FN0sP6FFVvyrOrVTqh4e5Ouwh6H2
         6eyNtqjjqNZ7KJULOJZFGkZnEf3K8t7fOVIFWlDkPti1GXcTjuyzQi/Cb9yzPlJ69Yjn
         R+1Oi50z3ZUbrJLX2U7BZ3PIPJ5p7k6cev1ucTu5udSm5TNgWdP8/BvvrL7fsEsHyRJX
         uLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691103812; x=1691708612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rqQhR/5Zg/iUnJ10XmwJefyLz1QkYmSYn+GFkwwlYbc=;
        b=XUDKVgaPT+MUW44YozCaWyxYeXQSOPZl6lzjHMS2lC3kzGtr29ioMtmoS+dXgh3Yts
         EA2hfsABG5maZrnTQm6Bn4587mkbfTy+nt3+Jt1szSj2LGXDXtbyScD1MXcxQXhJbI/L
         dpi3YNZTvtoy6EiojYa099+xhLapWwil9cDmuTDljKV6HJANJ+mk1iAsbF3FWes4DB5D
         mDjDobcwjA0yZAe7GR+zlfCxnBnllFKhdPH6+/+dYEywG4r3GJmPUUMPa5i9ZZSz7L0o
         JTAhBzaxoSubpdy6AjKKmEpFagHKJmoDjttRBgweN2QX26OiJk9lRd7tQVlSOB7MDIV0
         lnyw==
X-Gm-Message-State: AOJu0YwxVisNsBLuEECyW/WE7wE2RpmC1FTvLmhD0sqbB3Pnlr7HM2Y1
	VMpzVz5492P5hs2Xf7ysTy8=
X-Google-Smtp-Source: AGHT+IH6qzLAEk0DNXUGSi4Ov1sMseW89CXGNENYfRxBDHDuYglyYwG/GmeBL1qR9REfd6DQoc6BZg==
X-Received: by 2002:a17:902:e744:b0:1bb:bbd4:aadf with SMTP id p4-20020a170902e74400b001bbbbd4aadfmr122041plf.61.1691103812666;
        Thu, 03 Aug 2023 16:03:32 -0700 (PDT)
Received: from taoren-fedora-PC23YAB4.thefacebook.com ([2620:10d:c090:500::5:e60a])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090322c700b001bbb598b8bbsm372349plg.41.2023.08.03.16.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 16:03:32 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	taoren@meta.com
Subject: [PATCH 1/3] ARM: dts: aspeed: Update spi alias in Facebook AST2500 Common dtsi
Date: Thu,  3 Aug 2023 16:03:22 -0700
Message-Id: <20230803230324.731268-2-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230803230324.731268-1-rentao.bupt@gmail.com>
References: <20230803230324.731268-1-rentao.bupt@gmail.com>
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

From: Tao Ren <rentao.bupt@gmail.com>

Set FMC controller to "spi0" in ast2500-facebook-netbmc-common.dtsi so
the spi bus is consistent with the flash labels defined in flash layout.

Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
---
 arch/arm/boot/dts/aspeed/ast2500-facebook-netbmc-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/ast2500-facebook-netbmc-common.dtsi b/arch/arm/boot/dts/aspeed/ast2500-facebook-netbmc-common.dtsi
index c0c43b8644ee..7f1ae3f4df9d 100644
--- a/arch/arm/boot/dts/aspeed/ast2500-facebook-netbmc-common.dtsi
+++ b/arch/arm/boot/dts/aspeed/ast2500-facebook-netbmc-common.dtsi
@@ -4,6 +4,10 @@
 #include "aspeed-g5.dtsi"
 
 / {
+	aliases {
+		spi0 = &fmc;
+	};
+
 	memory@80000000 {
 		reg = <0x80000000 0x40000000>;
 	};
-- 
2.40.1

