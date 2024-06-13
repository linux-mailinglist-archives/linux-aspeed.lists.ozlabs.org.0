Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FD5907690
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Jun 2024 17:26:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zi/5gvp4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0R8l6KR5z3cXs
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jun 2024 01:26:47 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Zi/5gvp4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0R8b4x3yz3cVG
	for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jun 2024 01:26:38 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7046e87e9afso963264b3a.0
        for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jun 2024 08:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718292390; x=1718897190; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XksUZgqg8NfeHhI39cm8pxdIZtUDqwJpq3PLGmvWKlA=;
        b=Zi/5gvp4+s2E194Bt5+rLUgh71yS1LJ4R+bYbgb+M5EitIlnEQC5p5gC/K2PXwy/OT
         Gly6TTPnkCDHtVHaNO3MhX+jSFrgv2b7r6pFxHkLqOm3leBjQThH5E2qgTsSdlEGayV9
         5heRDuUjEuo0PpppQWDIXkH5Upd+d1b+ypVV/ZxOyDAaz5uIWl7Ne9ZMZNK+UVUYboyg
         VfB1k0MbQVLlRhvc1b3w/YfavE0rg1Z6/P4KlU45i4Bcpo6WtI+hzq6xfdZ6rz1yo8H5
         eHPgjgoAdG6/5jhq/prYSReHoLPgV92UfLZcrsWo4rNqOwh3yT5ducor1tXK2Nau9sWx
         PYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718292390; x=1718897190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XksUZgqg8NfeHhI39cm8pxdIZtUDqwJpq3PLGmvWKlA=;
        b=mzokbrdmfF+846gwQ7dZw3F8IW5JZFnTAZmPpb11Pmv0aqIzDKXaHFB/JRwIWgFVOs
         8zfyLofOKlpqx4sMgzzxJA+NnIbF4ifoHfGeRTyv6JGPyo5S6XGzH6B/pMb3USGJWUEj
         1trKapUvkGNIM2F+RIvWFMKNb94di1wCiYOx5cV6TPi+3m5KUDVsKpA0ZQKG5j9/qBxw
         hPgxRw4BqOFdq0XMp9243cyWFjzocGH8Oq6DgWpBAZj38NOg6lZkbZfqy2UiwhLmTUit
         9Yr/aBNw58WgRaX6YORAsGOBZmOYPCWSp4LL1oUuv3KiUo4Vk4I5ScLOwAr/ahzgNbJG
         B59A==
X-Forwarded-Encrypted: i=1; AJvYcCV8HOzxI5JIvVoU/k5mb23UOHNek9+nDxTUvgnU9ARxy6KfCK95oXmBdMpm1lV8SJlS6h1qN4g5m7j5KtfSID5ow8Hso8ggp1nhkXQT3w==
X-Gm-Message-State: AOJu0Yx536H8PG81TQ7wzbwnI2EHO8KWMkrppEOVPQyvreC8nox80W86
	BAO4ncXhVf9Mlpqp+YFWGMOQ96pXW+hC/DTwNL7NwYpOI1oslLt7
X-Google-Smtp-Source: AGHT+IE5EGv/LZQSRF88ln1cUwqt+xnBZ3RL9ku+PGn1tJNTrwmyidsoS6sanfiqW8DZpU05wSZdxw==
X-Received: by 2002:a05:6a20:7fa9:b0:1b6:dd01:ad2c with SMTP id adf61e73a8af0-1bae8214321mr190662637.44.1718292389931;
        Thu, 13 Jun 2024 08:26:29 -0700 (PDT)
Received: from peter-bmc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee41663d2sm1198183a12.92.2024.06.13.08.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:26:29 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] Revise Meta(Facebook) Harma BMC(AST2600)
Date: Thu, 13 Jun 2024 23:24:18 +0800
Message-Id: <20240613152425.1582059-1-peteryin.openbmc@gmail.com>
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
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Summary:
Revise linux device tree entry related to Meta(Facebook) Harma
specific devices connected to BMC(AST2600) SoC.

Base on: https://lore.kernel.org/all/CAPSyxFRj0twCJG6Lr5UZpznrUHyd_L0Reo=kZSFwCw3FNQ+x+A@mail.gmail.com/

Change log:

v1
  - Patch 0001 - revise hsc chip
  - Patch 0002 - add VR device
  - Patch 0003 - add sgpio name
  - Patch 0004 - add ina238
  - Patch 0005 - add power monitor xdp710
  - Patch 0006 - remove multi-host property
  - Patch 0007 - remove pca9546

Peter Yin (7):
  ARM: dts: aspeed: Harma: revise hsc chip
  ARM: dts: aspeed: Harma: add VR device
  ARM: dts: aspeed: Harma: add sgpio name
  ARM: dts: aspeed: Harma: add ina238
  ARM: dts: aspeed: Harma: add power monitor xdp710
  ARM: dts: aspeed: Harma: remove multi-host property
  ARM: dts: aspeed: Harma: remove pca9546

 .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 148 +++++++++++++-----
 1 file changed, 109 insertions(+), 39 deletions(-)

-- 
2.25.1

