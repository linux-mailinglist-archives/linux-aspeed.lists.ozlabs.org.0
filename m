Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D67EE91C56
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2019 07:18:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bhz66JQvzDqg9
	for <lists+linux-aspeed@lfdr.de>; Mon, 19 Aug 2019 15:18:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="nvB93+LI"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BhyS21yTzDr95
 for <linux-aspeed@lists.ozlabs.org>; Mon, 19 Aug 2019 15:17:51 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id g2so470411pfq.0
 for <linux-aspeed@lists.ozlabs.org>; Sun, 18 Aug 2019 22:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TGwG/YSLZYRVL+vJAKs5Bcm3MpdJbEenYZGdWxEpLBk=;
 b=nvB93+LIMhdoi2CaaDpCzS7o1dOMNM+3A21WKpAKWBnuWmftjA+IkGp1UzjUoGvPt2
 +j2EkS5G6ZY46CUxngO27FKFUsqU8w3ReyRRX3UkR+1drtyCLepHPwcN5KW09jab+Zhb
 GScQZ2FStl1PJZ2tDHm4H4BfYEB0YVkzx5LUaREW/9sLMPuMubqY+IalqiR/AXhQrMKp
 0432fj4jPoYILRdkyfhjSr0lR0ICE1fNNzAfcNzye9ffj+BHbqpe9901MBV2oVN3VOC2
 Cfjpn+91AGskyGX4QGYBSsI3t/aGs34xkui9kVhCZQ9SWmY/yoCefRSpaDeVNXe00XKq
 LmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=TGwG/YSLZYRVL+vJAKs5Bcm3MpdJbEenYZGdWxEpLBk=;
 b=nd3z1fsrQgJQVqyASmunjsiFxsAKpXztYbaXc/1btu+t8mzAcMkY7edtbOHC6GuRvI
 GX5INITUE4PX9jL2THU3sCLVdVdDLVaNeDOCT3bOS39aPqAS3EvOvuauJK3tOjyCMU30
 jJ9XbAUsG7CM7Ws+Z8Bk7HH5dshQ8dN2CgefaODpfGtWE6jAZEqdSKT0yJjorVVnMtJU
 Ba/fpOr6WVfgFOFv9l4GmANBy5tQ/cGTaa27MstWPUr0YEu8bBwdqJbPZ+tqREr3wzDR
 I4yWKBo9ln1sMzSgqNmqSo7NFDdx75RnFgb66JB9pc1qyGqpyZxJOtg96IvWHjCfIbXS
 1ncw==
X-Gm-Message-State: APjAAAVtKRfVHMR/0V8s+I2aozaIQfoOlfBRDbveKMCSZNRZykG7/FiF
 iIJwCfE8gzffYiR9oFVLpR8=
X-Google-Smtp-Source: APXvYqxEgQ3FMUcGf8WGHJW4wXZcDWRMRgUVb9y2dWwhkvXh49b+GxwAQ3nXnVqyKo2MlegRrqcf2A==
X-Received: by 2002:a63:ec03:: with SMTP id j3mr18981805pgh.325.1566191867962; 
 Sun, 18 Aug 2019 22:17:47 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id o3sm19010087pje.1.2019.08.18.22.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Aug 2019 22:17:47 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 0/2] watchdog: aspeed: Add support for ast2600
Date: Mon, 19 Aug 2019 14:47:36 +0930
Message-Id: <20190819051738.17370-1-joel@jms.id.au>
X-Mailer: git-send-email 2.23.0.rc1
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello,

Here's a small patch series to enable the ast2600 watchdog.

v2 addresses Guenter's review.

Joel Stanley (1):
  dt-bindings: watchdog: Add ast2600 compatible

Ryan Chen (1):
  watchdog: aspeed: Add support for AST2600

 Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 1 +
 drivers/watchdog/aspeed_wdt.c                             | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.23.0.rc1

