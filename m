Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BE78242FA
	for <lists+linux-aspeed@lfdr.de>; Thu,  4 Jan 2024 14:48:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k9taYkEB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5Sb93hn9z3cX3
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Jan 2024 00:48:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=k9taYkEB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5SZs5BN9z3cYV
	for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Jan 2024 00:47:49 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d3dee5f534so10134905ad.1
        for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Jan 2024 05:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704376067; x=1704980867; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mmt0UdSDV+w1BWZtmNFxfAxPy3KjCbVYZPCzBNdDlQ=;
        b=k9taYkEBholDGh/RmkSuGQLqd5uvRxpiMg31kujg/4PejQQtRgAjW/WD4IB/hOHmm2
         SpuHUtIjgQJE4sg7cZJO07qqwbzNULNJTwJ0IKEkfxhEDDi9rfPrU7PBTVYJOXvPTnFv
         2bXFprQN8vUbAywES2GOMYIx5BVJfD/yZZ4M5HWkwNQuWVJl3Hul1uwi63Os6obgqQrw
         R7uPxuotvdzZj9kwWaDo06Va1qvaJDmeEwANYRgQyBKn8quJtWnJE0/4DBdYvQmAQJsx
         8QR5L/i0AiSpaiKad3LBqJrJ7NEzsvdzHLW2ruWBlejtRh3WpqdYqk+FfuoDKD5wiV/D
         RJ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704376067; x=1704980867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mmt0UdSDV+w1BWZtmNFxfAxPy3KjCbVYZPCzBNdDlQ=;
        b=jNOuM+8dz2wwkqdmh48RbxQApO/SNUMd7ZP30CsXwNKDteQ/eAvfKMrfkAZZSVC9Q2
         XrXssJFPSfBj8tOLz4+0s/tpuXyhEaedpH4xPcuNv9Snhm3TdaIv5s5mEh3Pb6hxbZMV
         ONX73sodtnKzMvNciGqQVpKzDXVZKEPcieh4adDXr1Tm3xu2R0/5mfEHDUuNNV1ZK7qJ
         GBOv+zTKn8SzJ7fJCefsLnehMyT2kvf+vnAr7PEZAEQIbr7Sqc/1DDb4Panp0/aXoC4r
         IrnavHMdEatwz1hXDom/zdR/YSTX7j01+FlXqi5UVeK9rDQ+qR0NIicTO/kwHuGqYgZk
         ag/Q==
X-Gm-Message-State: AOJu0YxYBvo5Yg0gQuOGdIFKz8PE7YTf4/D83jZqgh+SO5AW8DMhTEZY
	bkNeb9wdGNnkZ8LxeROPgMk=
X-Google-Smtp-Source: AGHT+IF7X1lreIaoGxYOY0Mw924RintZD1lo9Uf8+TBROV+grUK3C7/HxBu+kT8owOJIrT3JfzUsBg==
X-Received: by 2002:a17:902:dac5:b0:1d3:f344:6b01 with SMTP id q5-20020a170902dac500b001d3f3446b01mr745037plx.3.1704376067201;
        Thu, 04 Jan 2024 05:47:47 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id a22-20020a1709027d9600b001d425d495c9sm22990550plm.190.2024.01.04.05.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 05:47:46 -0800 (PST)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] ARM: dts: aspeed: Harma: Add cpu power good line name
Date: Thu,  4 Jan 2024 21:45:30 +0800
Message-Id: <20240104134532.536793-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240104134532.536793-1-peteryin.openbmc@gmail.com>
References: <20240104134532.536793-1-peteryin.openbmc@gmail.com>
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

Add a line name for cpu power good.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 5d692e9f541e..36aad01dda20 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -501,7 +501,7 @@ &sgpiom0 {
 	"","reset-control-cpu0-p1-mux",
 	"","reset-control-e1s-mux",
 	"power-host-good","reset-control-mb-mux",
-	"","reset-control-smb-e1s-0",
+	"power-cpu-good","reset-control-smb-e1s-0",
 	/*E0-E3 line 64-71*/
 	"","reset-control-smb-e1s-1",
 	"host-ready-n","reset-control-srst",
-- 
2.25.1

