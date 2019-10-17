Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E951FDA55E
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Oct 2019 08:14:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tzQg0bHPzDr9K
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Oct 2019 17:14:35 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Q+5CxomM"; 
 dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tzQW4mDxzDr61
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Oct 2019 17:14:27 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id n17so1955070qtr.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Oct 2019 23:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=SSycC+6FLXhjLvO+eUNuIjWKaeeqP5Qat7UwzKeLNrc=;
 b=Q+5CxomMgCIuC811bGWVLqai3qJaMmwh0GRCQJhvQ6vVu8IIFArRU0cpmmsnmN/ass
 uhaeYa6PoijW/wlmpLyzkIwDPnypt7XyezWbs3c3AIvUXLkfbGjE+fQfj1dwf6B+Q1s9
 aEbk4TmWXzVivz7KRfiQUdTyY0Hk519+pctLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=SSycC+6FLXhjLvO+eUNuIjWKaeeqP5Qat7UwzKeLNrc=;
 b=GnEq1MvMt0/1pFruKUhgQlUeQ6B4EJ7YfihawlN/JYP8i/84nlDDrcQ9i4uQiJrtMc
 no86vbz04EoGG/vGT6KvoydW5vlco9NEcK4RwH3W02rNy4pE0OdGM7C/PB7hWAFlx0t7
 nIfrUEpLDGgLYeHhABtPJUuKDTl/FO/VRk+K5/ZjZqDUwe44Bma4fviGScFWLTY62il1
 xwwTp6guCDJ2ALgkyHO3axh4+xRjCsuFQBajHKGnWqyR9XjGntu11dMJaXrJmApD6ZCn
 N4UMBrKWqHbh4EMO6iRQVQnLXuN/WiRkEN5+Wv8nbDOLzcspV96tgZXMd8AFMAPkXaiN
 z1Sw==
X-Gm-Message-State: APjAAAUbM3X/R0hB348Idt1QKPnMgL8BFLSAwA8BDgq28DQWqnfxaj3R
 sWZFiciKnVb+G5aUlKc1y9LihyaqC3CnN7jWMeI=
X-Google-Smtp-Source: APXvYqybdSTvJP4mqxmA02QqX34n8BkIiZfZkjF04g5uxjmwq02WKO6wV9i3aSGwmn5+EmR6PpqWfL4/8c2snFqWktU=
X-Received: by 2002:ac8:1207:: with SMTP id x7mr2116697qti.255.1571292863733; 
 Wed, 16 Oct 2019 23:14:23 -0700 (PDT)
MIME-Version: 1.0
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 17 Oct 2019 06:14:12 +0000
Message-ID: <CACPK8XdqFkPgCQcgpM5C_YwfJ86Lmk=hG5zTcfbCDCMncXCJMg@mail.gmail.com>
Subject: AST2600 i2c irq issue
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, 
 Brendan Higgins <brendanhiggins@google.com>
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
Cc: linux-i2c@vger.kernel.org, linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

I have been doing bringup of the ast2600. It contains i2c buses that
are register compatible with the ast2500, and I am running them
without buffer or DMA mode. This is with v5.3.6, with no patches other
than adding the compatible string:

--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -938,6 +938,10 @@ static const struct of_device_id
aspeed_i2c_bus_of_table[] = {
                .compatible = "aspeed,ast2500-i2c-bus",
                .data = aspeed_i2c_25xx_get_clk_reg_val,
        },
+       {
+               .compatible = "aspeed,ast2600-i2c-bus",
+               .data = aspeed_i2c_25xx_get_clk_reg_val,
+       },
        { },
 };


I see this behavior:

[   20.981417] aspeed-i2c-bus 1e78a280.i2c-bus: master failed to RX
[   20.988259] aspeed-i2c-bus 1e78a280.i2c-bus: irq handled != irq.
expected 0x00000014, but was 0x00000010
[   22.451265] aspeed-i2c-bus 1e78a200.i2c-bus: master failed to STOP.
irq_status:0x0
[   22.459909] aspeed-i2c-bus 1e78a200.i2c-bus: irq handled != irq.
expected 0x00000010, but was 0x00000000
[   22.470604] aspeed-i2c-bus 1e78a200.i2c-bus: irq handled != irq.
expected 0x00000011, but was 0x00000000
[   29.156951] aspeed-i2c-bus 1e78a280.i2c-bus: master failed to STOP.
irq_status:0x0
[   29.165601] aspeed-i2c-bus 1e78a280.i2c-bus: irq handled != irq.
expected 0x00000010, but was 0x00000000

It happens on boot, and can also be triggered by placing load on the
system. In particular, if I copy a large amount of data to the flash.

The IRQs are being served on one of the CPUs:

 29:          0          0     GIC-0 142 Level     1e78a080.i2c-bus
 30:          0          0     GIC-0 143 Level     1e78a100.i2c-bus
 31:          0          0     GIC-0 144 Level     1e78a180.i2c-bus
 32:     302596          0     GIC-0 145 Level     1e78a200.i2c-bus
 33:     197340          0     GIC-0 146 Level     1e78a280.i2c-bus
 34:     196900          0     GIC-0 147 Level     1e78a300.i2c-bus
 35:          0          0     GIC-0 149 Level     1e78a400.i2c-bus
 36:       2199          0     GIC-0 151 Level     1e78a500.i2c-bus
 37:          0          0     GIC-0 152 Level     1e78a580.i2c-bus
 38:       3407          0     GIC-0 153 Level     1e78a600.i2c-bus
 39:          0          0     GIC-0 154 Level     1e78a680.i2c-bus
 40:          0          0     GIC-0 155 Level     1e78a700.i2c-bus

Following a hunch, I booted the system with SMP disabled (it's a dual
core part). The issue did not reproduce.

This suggests the driver is lacking locking. I am yet to do any
detailed debugging.

Have you seen any behavior like this?
