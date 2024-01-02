Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02736821703
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jan 2024 05:48:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W8VsNhox;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T40j055yQz30f5
	for <lists+linux-aspeed@lfdr.de>; Tue,  2 Jan 2024 15:48:04 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W8VsNhox;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T40g01bchz3bYQ
	for <linux-aspeed@lists.ozlabs.org>; Tue,  2 Jan 2024 15:46:19 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-28c93513462so1790976a91.2
        for <linux-aspeed@lists.ozlabs.org>; Mon, 01 Jan 2024 20:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704170777; x=1704775577; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pegTGAgIl7701EaFNdsQSg89lpjeCGj36MeNrr3t5wk=;
        b=W8VsNhoxJolSPMqSuPYSdUXt/mz+g8tSTBna+FwMGktC/ZX2647atnQCxaPCQrbPtk
         Sj63C69P/qSf3ZuOiHirkv27oZpQuUD5Ij9AiMn63KkuZKeSm/8amQT0VKZ4jRH9j/VE
         xaKExfs0xWT458cOaBWUkYq1ypF/SWMXqcJnq2GLXMNigj60DD/xdR0pPyWuDjOflJHs
         rlnDAeZqGObv5h9ZoZB6RLE96Rd7R1ZZUNwo365+0SJD5M2EhDfBi9G8TldwSf6x5bt7
         ynGZZAPU63kdTDp7hMbe0/OkfdJ6ap+rbdwsOlslOILuZFW18XhWss9/zyovlmoPT421
         eVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704170777; x=1704775577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pegTGAgIl7701EaFNdsQSg89lpjeCGj36MeNrr3t5wk=;
        b=lLUTLBhvPR8ml+YV2W8IJLTD3yAw4nCz7h5ahytaG1cvlH4O7Yar23AjF+vqmwdLF0
         lS2q7zqH3KPZLVfWz6KQ1jb/GunmM7i32iMMEq5mM0qe5S1sWXwcWbD2gWUXuXQIIUe3
         SDLm1hKaUG1EX0lCvjjm/BiCqQgk8IUwigYfHWHNaF1vo6n8M7aNy5t70XTiVbCAFcd0
         tdV8N1gXA1aI5AvFBSXd2JwGzj2ZXi1/78GxvCye6aqNLC7P0w8VtiF6XE1crkdHPBuo
         +XsI94/eG581t05V9nsAO+41u+1M5bdHgSWALP+Z8IZyYnBAh1GdcxMy45P5Setd9sqK
         BWSg==
X-Gm-Message-State: AOJu0YyqT/RwM5PeZkMZswuRL0t3yN1SyJKQQUZAd6vJ6gverai+C682
	6YkNlV7yUyj1Km6bQK/9MUhAKvl7QOA=
X-Google-Smtp-Source: AGHT+IF3LqXMu5rUi/ayumGisrNXTGKX7bcbdyYwyFjHp54a4fVsRcuAeq2mGkGmVOteQsOtxFRFeA==
X-Received: by 2002:a17:90a:f98d:b0:28c:843c:105b with SMTP id cq13-20020a17090af98d00b0028c843c105bmr3699238pjb.27.1704170777666;
        Mon, 01 Jan 2024 20:46:17 -0800 (PST)
Received: from peter-bmc.dhcpserver.bu9bmc.local (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id d21-20020a17090abf9500b0028c2b2b76c0sm17308392pjs.22.2024.01.01.20.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jan 2024 20:46:17 -0800 (PST)
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
Subject: [PATCH v1 2/5] ARM: dts: aspeed: Harma: mapping ttyS2 to UART4.
Date: Tue,  2 Jan 2024 12:44:06 +0800
Message-Id: <20240102044409.3810873-3-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240102044409.3810873-1-peteryin.openbmc@gmail.com>
References: <20240102044409.3810873-1-peteryin.openbmc@gmail.com>
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

Change routing to match SOL(Serial Over LAN) settings.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index 8a173863ef24..a0056d633eb1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -12,8 +12,8 @@ / {
 
 	aliases {
 		serial0 = &uart1;
-		serial1 = &uart6;
-		serial2 = &uart2;
+		serial1 = &uart2;
+		serial2 = &uart4;
 		serial4 = &uart5;
 
 		i2c20 = &imux20;
-- 
2.25.1

