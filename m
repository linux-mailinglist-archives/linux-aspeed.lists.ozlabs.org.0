Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C17A97E4
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 03:16:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P2nv6LPpzDqws
	for <lists+linux-aspeed@lfdr.de>; Thu,  5 Sep 2019 11:16:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="mzLpXBBS"; 
 dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P2nl5hbwzDqy6
 for <linux-aspeed@lists.ozlabs.org>; Thu,  5 Sep 2019 11:16:11 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id d1so413422pgp.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 04 Sep 2019 18:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z3Ei8FyHzXCEAswMjYYL2sgHBCg2TC7hkQhTjvYG8KY=;
 b=mzLpXBBSjIfPoEznzDVi8hEGCoi8iPdVtV8Hzs4xr0PPj03usX/NK85vi1/SC3DNJ8
 cbZm8aJV/muvSP7U5x2czXSHfhO8XhBRtYzUArCTgPG2U9p6fC9vhcLGmJCOq9QXy/9t
 CqH78HGJ00MSIcznSifqNso3bpZsBijFDPVDgPHJ6++c9yIaodj1B+YLBgFe+97RUrOJ
 sxIpfha+z/sQQqJAKYoxfeq+BT3sVV1vSsS5gEArAfjltMN1X7UnOWbwlraaWgwArNeq
 UoQiewIqDIxmx42RFeNT2rw7VX8+4GIdY0qDdLSI2SIDPTkhU7xpEkVJGYxnEmFYLjP1
 waRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z3Ei8FyHzXCEAswMjYYL2sgHBCg2TC7hkQhTjvYG8KY=;
 b=YeYsRxTAXOS6EoP+KvhfjgnyQyzEyxD3LErA2ALe1xJPD6sYI8P8A4coewTEkCmTOu
 R8ug8pcW2xzlFwTbSIMJB5H6DBlgWyOD2o2ea1l0gfa7E9Cs9/rExZVzJn91VrxH+lI8
 wfYbpCICdUfGRux8VZ1r9G2RmeBLO4X1vGHNwTq8fZLmbG3Sf3nqcfYR+cKb3xFzMOeV
 ExngUzwRWLMIQ5xpNrvUs4iiAoKM7xXeTBwA2UBOMrQl+j3eT8j5rTVYoN2ZvnGQfhWv
 /M+4S15nhMvFgkEkn5IjAb1w/BTACK5J2fWU6Q8HvsYYRBZJ8hDiL6z26Ctuo2/LFdpy
 /qRQ==
X-Gm-Message-State: APjAAAWTrRyIO3OE7/Vo6Zf5fBR0v9hNkEP42epaGFY+Urb2QPUgMu7z
 ITdqAfaCAdrJW5AZQK8Pdec=
X-Google-Smtp-Source: APXvYqzTqKmk34vcZ/2Fksg66IicendpcLZGFN0xLJvxlsd5PmuspSmVqBJQBYhJ3l6UV1K7WLBbzA==
X-Received: by 2002:a65:4304:: with SMTP id j4mr837941pgq.419.1567646168290;
 Wed, 04 Sep 2019 18:16:08 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id v43sm6300914pjb.1.2019.09.04.18.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 18:16:07 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linus.walleij@linaro.org
Subject: [PATCH v2 0/4] Add ast2600 gpio support 
Date: Thu,  5 Sep 2019 11:16:00 +1000
Message-Id: <20190905011600.15821-1-rashmica.g@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: linux-aspeed@lists.ozlabs.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

v2: More verbose commit messages, using DIV_ROUND_UP().

Rashmica Gupta (4):
  gpio/aspeed: Fix incorrect number of banks
  gpio/aspeed: Setup irqchip dynamically
  gpio: Add in ast2600 details to Aspeed driver
  gpio: dt-bindings: Update documentation with ast2600 controllers

 drivers/gpio/gpio-aspeed.c                    | 48 ++++++++++++++-----
 .../devicetree/bindings/gpio/gpio-aspeed.txt  |  3 +-
 2 files changed, 38 insertions(+), 13 deletions(-)

-- 
2.20.1

