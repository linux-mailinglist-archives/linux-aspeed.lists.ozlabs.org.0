Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E67713394C
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Jan 2020 03:55:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sv4h0YNSzDqNs
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Jan 2020 13:55:32 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f42;
 helo=mail-qv1-xf42.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="GwTExAKs"; 
 dkim-atps=neutral
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com
 [IPv6:2607:f8b0:4864:20::f42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sv4V01ZxzDqCR
 for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Jan 2020 13:55:21 +1100 (AEDT)
Received: by mail-qv1-xf42.google.com with SMTP id f16so821469qvi.4
 for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Jan 2020 18:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=D9/u+j2j6zRtqERoabJ1WOdMTYaBzefBw5186J3rAKY=;
 b=GwTExAKssKvTTPZz/9+b+HQfwc03smWzvB50u8vCmP42imVJ0mDE4NV3FA1cv68pVi
 ugIkjOqcDLv5Dyv3H82MIlugGoEn+af8Ok7oW6PyFrYYZqf9ckXp9SOoqpSOw915FPDV
 lu6K1b/OHjTjlcmoHGgJFeqdBUOXXH2kmd9Ng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=D9/u+j2j6zRtqERoabJ1WOdMTYaBzefBw5186J3rAKY=;
 b=P0myffqMyp3rzt2ljBzvtGtxLOijLIdVFF/X0D/HYEb22SWUjoWo0drSEuw6WH8lcM
 Dcz9OEEmv6hxBj5ePed8DMNSGeADcFFXBYc2fj9MY6tlBsi3rlBi3PuuEhRWbp5NPgJC
 E+v7qJM7MPXENbhdPNtnmXcNqFXEXxfoX48dQmIV9BOEzXYIWZbroF0e/1nQFuaNB8Md
 rrvZbX3AhW1ix0cnljtB3P7omz50DQZBCDigLRqAm0xcZSgdZKRuKG0AFsgeEeAgGf5A
 vfsuhPiBcdS6pucF5uw86kXaPINVWwihrBa2KA7ONG6cSB+eJUzliQQT82ZtsXw+p2sS
 /YoA==
X-Gm-Message-State: APjAAAXvZK5fFIKN77AHZ++l8YpF/b3wtRyiqFmmIgk0f6X6PDeRFe+j
 r9PuuZKKTDHYggBxM8+H4KAIRPB0hiwRfkUG1KA=
X-Google-Smtp-Source: APXvYqy+yirOcMBT0dMGIZEA7YUC7mfEaQwZSAwSz/C6qZDcJWn2FzcYDFus2eFw4tYbNGF2fkE5wTHjrbyYr+qjJJg=
X-Received: by 2002:a0c:ed32:: with SMTP id u18mr2306048qvq.2.1578452116247;
 Tue, 07 Jan 2020 18:55:16 -0800 (PST)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 8 Jan 2020 02:55:04 +0000
Message-ID: <CACPK8XcjazgORXNZBU1ECMukXG4HA8D9VeDxiSPifDk_iB7_dw@mail.gmail.com>
Subject: [GIT PULL] aspeed: device tree fixes for 5.5
To: arm <arm@kernel.org>, soc@kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello arm maintainers,

Here are some fixes for some device tree mistakes that went in during
the 5.5 merge window.

The following changes since commit ffcdc5df08bfc4f418693b22cf2a1182de3375b4:

  ARM: dts: aspeed: rainier: Fix fan fault and presence (2020-01-08
12:51:03 +1030)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git
tags/aspeed-5.5-devicetree-fixes

for you to fetch changes up to ffcdc5df08bfc4f418693b22cf2a1182de3375b4:

  ARM: dts: aspeed: rainier: Fix fan fault and presence (2020-01-08
12:51:03 +1030)

----------------------------------------------------------------
ASPEED device tree fixes for 5.5

Fixes for some badly applied patches that went in to 5.5. There is also
a fix for an incorrect i2c address.

----------------------------------------------------------------

Brandon Wyman (1):
      ARM: dts: aspeed: rainier: Fix fan fault and presence

Joel Stanley (5):
      ARM: dts: aspeed-g6: Fix FSI master location
      ARM: dts: aspeed: tacoma: Fix fsi master node
      ARM: dts: aspeed: tacoma: Remove duplicate i2c busses
      ARM: dts: aspeed: tacoma: Remove duplicate flash nodes
      ARM: dts: aspeed: rainier: Remove duplicate i2c busses
