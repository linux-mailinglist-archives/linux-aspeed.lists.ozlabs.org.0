Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 912549578C9
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 01:56:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WnqHR1H4Tz30Ss
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 09:56:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SihN0Jpx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=ppighouse@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPJvK3kzCz2yVT
	for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jan 2024 19:57:00 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6ddc1b30458so3272374b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jan 2024 00:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706605018; x=1707209818; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=csHtYc18T35qzB25mdonMqPpqm2KB0P8ynV8OZQpVBc=;
        b=SihN0JpxxJXbU6iHHsGuMqCo1v1aDWtfN7K+q5v2GG7G7K9h6H8iSbikcxf7bB2E+s
         zbmz4WFRyGpHRoYHK58+TPrweejhH5e9tK1D/Rr4ONbXgpams4751cUpcTnEyCd8sr0V
         yKMiV6Enktm16LBh5rXi8mELjozgTNCKLxsIAQWcKvjBu9KPrsJZ2Z4rqgDYIF5NLYM0
         Yr/Ec9mV+Blf982usdPMRtu/72stCmYdZkJnsrgvEGBSd+6/bTjXP08oR1UT/G6cNlfe
         8sviFd/WipphqW7+kiCLSELdC9r1Y1t9tKxgfTOQTCcs5BNEo6fBPN5a0rwjztuU/+iB
         xwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706605018; x=1707209818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=csHtYc18T35qzB25mdonMqPpqm2KB0P8ynV8OZQpVBc=;
        b=rWwanmG8oU3PU8Jq9F68Z1HSDiBqiJyLof0y0JD943XVdYYN/SXn43DrDlMbpvgUHK
         vB03HWAWTa7xdZobrlSgzH3KIWMZGGzYi2qNC2hpIW1bL9PYyRK5wySMXEBG8Ych4bv4
         uSZwpJIkw4/e7a1VM0cNQayqXQS2NXsl2763wgk5LK6xdnV0/0Y/NoyiV11C0uN3MVFM
         NTj7zysl8nJYD7yTcFUZjoLr5TbphK+j42XatVPlhNgNw3ksmrNBhs5KF0yLHby89rL7
         njxTcEev57fgMOBBqEtlIG+8NfedhlXhBvwZ+DDmW8OzPy2P9OB1CNYj0jVJDAiDz7CU
         H2BQ==
X-Gm-Message-State: AOJu0YzqaKf2veAesPZZ4E2tPJAQ7O5KGWfuxICcq3VuOhiwfUv76xiJ
	l5VImJ2VzgCVywnLIZXIHXcp6X4xe8nx31rZuVtvU9OuHltrYss4
X-Google-Smtp-Source: AGHT+IEeEh9/BgmgK6L5VDqDZJ/c+zKQ+BgD48oiN1HRyxWZSnWDQGOjvUOykG0CouswggmIuzdQRw==
X-Received: by 2002:a05:6a00:2d05:b0:6db:cd50:a716 with SMTP id fa5-20020a056a002d0500b006dbcd50a716mr7165222pfb.1.1706605018330;
        Tue, 30 Jan 2024 00:56:58 -0800 (PST)
Received: from localhost.localdomain ([124.218.12.74])
        by smtp.gmail.com with ESMTPSA id gx20-20020a056a001e1400b006dde04c10dasm7188623pfb.217.2024.01.30.00.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 00:56:57 -0800 (PST)
From: Kelly Hung <ppighouse@gmail.com>
X-Google-Original-From: Kelly Hung <Kelly_Hung@asus.com>
To: robh+dt@kernel.org
Subject: [PATCH] ARM: dts: aspeed: asus: Add ASUS X4TF BMC
Date: Tue, 30 Jan 2024 16:56:51 +0800
Message-Id: <20240130085652.198010-1-Kelly_Hung@asus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Aug 2024 09:56:01 +1000
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Kelly Hung <Kelly_Hung@asus.com>, krzysztof.kozlowski+dt@linaro.org, andrew@codeconstruct.com.au, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

This initial device-tree provides the necessary configuration for
basic BMC functionality and work on ASUS X4TF production.

Signed-off-by: Kelly Hung <Kelly_Hung@asus.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 749ee54a3ff8..80009948e14a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -74,6 +74,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asus,x4tf
               - facebook,bletchley-bmc
               - facebook,cloudripper-bmc
               - facebook,elbert-bmc
-- 
2.25.1

