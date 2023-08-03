Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A08176F5EE
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Aug 2023 01:03:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cMH4kHq7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RH4CL5b4vz3cN1
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Aug 2023 09:03:42 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cMH4kHq7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=rentao.bupt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RH4CB54gfz2ydR
	for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Aug 2023 09:03:34 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-267f870e6ffso811656a91.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Aug 2023 16:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691103811; x=1691708611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4gfB5p3kRpBivbHYK4HRVuajZlERtQJzXdWJ25BRbik=;
        b=cMH4kHq7Pva3x8dCkDZhimbqURQsYQN+ZCqI6vu+9FwzPXD7i3spF4pZLPhgtKgccr
         J1hzL28DjJObF8nvTfgQucdy225noVbtWXaUf197LP9E6HPD+Wd7he3GQu0nqxuHcfOG
         OUtBnYh9MHLyjNVvUaMGVjzBoMDvxGfSN27Xq+Hk5cJtOaRENYNh8d97yBbkQ8M8QqCx
         F2yFz7FdtY+PEsE0F+ZpLHXY/b01rSXbrmFEGLViwStUJbrZQKw3Un6NzDkiwTmDFwE+
         vCXaViadQq94qiX+dOAHbYPnsXj9M9k0fFhTkRdWDCDlmsWu71kYauTOhIF7YhqGPW7y
         pcOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691103811; x=1691708611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4gfB5p3kRpBivbHYK4HRVuajZlERtQJzXdWJ25BRbik=;
        b=AenlyVz7QplaSfy5oziK/gL12dQsPl3t0/YoTaTZ/FxM0s9egOqgupXIPLrygyl85S
         7JYvVjcMILhlMa5xdqDbGADIejjejVx2y0mz8EPzfvT4QbEHEvC2Fz0VcxNEJzeNdNRZ
         4Pl6e+ODu1OoYkUr/7mfett1JgNZV8jRPQUNrQHqETVyWt9GBVA0FJm+CmZlY8Seleyt
         RBFoJVjmQAAgYueM9RS87ETG8kamuqfkqslnUJau1XZPsXunC0vBODpkRb8d841llIqx
         We5GsELXcB3vv4zoodpaoEAd+QlqvX7iT8v4ElhVsdh6tKLMwWVpmrMYOiTddEIMusAL
         ndOg==
X-Gm-Message-State: AOJu0Yzl3pu5LxhDbNV4wJPNQtdUtITh1z92N73PjClwc9gYQ9DYkctN
	OfaNsNejNZE3BN0RzAS83Ug=
X-Google-Smtp-Source: AGHT+IGvjBU3bxLzbsm09R9c45orgIeqo6snaXMaan1h7W0xVECnryW6uvtgpU1ufvc8Uh7sx3dHig==
X-Received: by 2002:a17:90b:108c:b0:263:931b:bb5f with SMTP id gj12-20020a17090b108c00b00263931bbb5fmr98860pjb.14.1691103811297;
        Thu, 03 Aug 2023 16:03:31 -0700 (PDT)
Received: from taoren-fedora-PC23YAB4.thefacebook.com ([2620:10d:c090:500::5:e60a])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090322c700b001bbb598b8bbsm372349plg.41.2023.08.03.16.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 16:03:30 -0700 (PDT)
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
Subject: [PATCH 0/3] ARM: dts: aspeed: Fixup Wedge400 dts
Date: Thu,  3 Aug 2023 16:03:21 -0700
Message-Id: <20230803230324.731268-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.40.1
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

The patch series fixes a few entries in wedge400 device tree.

Patch #1 sets spi alias in ast2500-facebook-netbmc-common.dtsi (included
by wedge400 dts) to make sure spi bus is consistent with flash labels in
flash layout.

Patch #2 enables more ADC channels in wedge400 dts.

Patch #3 sets eMMC max frequency to 25MHz in wedge400 dts.

Tao Ren (3):
  ARM: dts: aspeed: Update spi alias in Facebook AST2500 Common dtsi
  ARM: dts: aspeed: wedge400: Enable more ADC channels
  ARM: dts: aspeed: wedge400: Set eMMC max frequency

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts    | 4 +++-
 arch/arm/boot/dts/aspeed/ast2500-facebook-netbmc-common.dtsi | 4 ++++
 2 files changed, 7 insertions(+), 1 deletion(-)

-- 
2.40.1

