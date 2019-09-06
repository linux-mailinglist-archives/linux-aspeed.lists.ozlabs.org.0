Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0573FAB266
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 08:25:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PncT3YnhzDr7n
	for <lists+linux-aspeed@lfdr.de>; Fri,  6 Sep 2019 16:25:45 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=rashmica.g@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="KHw7ngbg"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PncJ5RbdzDr7F
 for <linux-aspeed@lists.ozlabs.org>; Fri,  6 Sep 2019 16:25:34 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id h195so3668248pfe.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 05 Sep 2019 23:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tB2RNxXRErmJ9e3PrRrfYZt/4IO0/YJdN93uotJXzmg=;
 b=KHw7ngbgKFGwXSFYuiQbGQBfie880OX2vpp7L7MkL1sULSWNTS+amLlNfeUx7rmuOp
 E9CSHIH+Snd+pHoNvNkmoZPMxy2VDvQqTpqGVu6G2n6Yu2DJQ33iR4a+b1nOTbCtdCkJ
 Ut6L9cfoS+yOgTUVEvlrjqyUeOHn17ryGyo0lFFLqh/mokWzyKNTkzYqmMrymwaxFF3e
 8wFtNMlScmfR4ntuMwoNwxaxjHmJI0iqON9yO31sLfTs/v1XFrEicM7OsWR1Rdtvjce9
 WdKepwAaq6dsMxsIXT8ilMO01Lezvk7CaRhJA6DSiYSJRoGNPSlNApc3uZpDPQIdBFK8
 9knQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tB2RNxXRErmJ9e3PrRrfYZt/4IO0/YJdN93uotJXzmg=;
 b=O1Gmftn2f1KolUCQSe9vrfnkaEtkT9i5L2sYSf+PaMEE5zG+89cIUhjC1OifJzXbuY
 NU7je/vXBw2x6dbKv9qJ+vdYKBfQmW8R6mmtCpWqZOaVcIeybWRG7OvJOAopQw8wqbVX
 S4/3+tYeUtfsRehK2L/1AJu1bhgxa1I8R7AcTtDlcPFV7qIG5aSob8ih2t6CI/VySZJi
 SrzG1ZWgIHYyjEwZvZ4S/ss6F7nN3EhQ/GsVJmBp5vW3A98Yyn++afv9QmrVTCRRz63P
 wlxfZPa82JsNL6SWyZQf1IVOtr1a6Pt1sVtxnhj6abIBuXqOYFleWfM5gLBYOfA/RB90
 6FmQ==
X-Gm-Message-State: APjAAAVWN7EjoFGl307BABphasvkgI/lYybl0yBQax22lpDGURYV5wOR
 qdcOIVPrg7GAVngnB8y24BA=
X-Google-Smtp-Source: APXvYqyQA5o7Nplg7Mz6cACJYxVi92CNBUmDeAZ/6//NQuySZy9WiwRBzeJBgCrM660faJtp+bFQrg==
X-Received: by 2002:a63:6f41:: with SMTP id k62mr6650552pgc.32.1567751130676; 
 Thu, 05 Sep 2019 23:25:30 -0700 (PDT)
Received: from rashmica.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id b5sm7950688pfp.38.2019.09.05.23.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2019 23:25:30 -0700 (PDT)
From: Rashmica Gupta <rashmica.g@gmail.com>
To: linus.walleij@linaro.org
Subject: [PATCH v3 0/5] Add ast2600 gpio support
Date: Fri,  6 Sep 2019 16:25:10 +1000
Message-Id: <20190906062510.13191-1-rashmica.g@gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

v3: Different ordering of patches, using ngpio property to distinguish between
the two ast2600 gpio controllers, fixed typos of 3.6V.

v2: More verbose commit messages, using DIV_ROUND_UP().

Rashmica Gupta (5):
  dt-bindings: gpio: aspeed: Update documentation with ast2600
    controllers
  gpio/aspeed: Fix incorrect number of banks
  gpio/aspeed: Setup irqchip dynamically
  gpios: Use ngpio property from device tree if available
  gpio: Add in ast2600 details to Aspeed driver

 drivers/gpio/gpio-aspeed.c                    | 52 ++++++++++++-------
 .../devicetree/bindings/gpio/gpio-aspeed.txt  |  7 ++-
 2 files changed, 39 insertions(+), 20 deletions(-)

-- 
2.20.1

