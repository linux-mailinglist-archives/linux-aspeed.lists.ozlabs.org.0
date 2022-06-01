Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDC4539BFD
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jun 2022 06:18:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCbTv0Bltz3blm
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Jun 2022 14:17:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gnORif3T;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gnORif3T;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCbTm1JW1z2yLg
	for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Jun 2022 14:17:47 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id v11-20020a17090a4ecb00b001e2c5b837ccso4939260pjl.3
        for <linux-aspeed@lists.ozlabs.org>; Tue, 31 May 2022 21:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=o/u+GQMNh/HAcOKl3CZKj/1opnd127HV5unYt41+gbI=;
        b=gnORif3Tpzt3B3qkKnNDkan4+1Zfo4v4jceA3/xRP7EuZGLzL6fIgFLxSezG+RjFix
         PXLDQIxh56zWN2y4QzD1Q4LpD39iErA3AvKF874hsa/RnPyrEwCBH5VkHuE/jAaQM9bt
         gR5TzF9COueiSqhm2MGTkIz2TyxozaukKm6tbXpKA5zqB+s1aIH2bBvJPQKgbgpQqJ2i
         4RjyVWEHXtIF62jSHUdLkbHHbNPEqXiUOeJ2AgNGB5o0tuMa7KgYpyma+QF+S/KPD8ZU
         CSyFXYku6245mQeQQMnbxjfli3vMAYnE6dN9UopmI3h8EiobA+m+UhTDcLvOQe0GUrBc
         taYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=o/u+GQMNh/HAcOKl3CZKj/1opnd127HV5unYt41+gbI=;
        b=H0TdEqyjaHDpjz2zfGe9b6m7ld5ZDhYFQmImm8MSTF9azMHkI+TvgVClPaNjvROPUs
         xaEhZdPTEYO0yidIPpFulPmyclD/IzzgnV+QWNiTuDeORZo2l+1pGPJDsjTu9jnNfReC
         d+Nf/OPiPcpLiiQga6bmS6SrVEtUGsHN1XSk+mFiBaUyR5sLGkRGz4uUudolRXRtDGpy
         HBQQFhcVFgduiKOCHHx4VuIZryobueWU87ihVJQzmFgKX18oGPKImYLAS7dTs55y//J1
         3Dfb46/mkCVZ0H+RVWkjeSjij+HWjtyTJUmGXiYF0jLZLYU1pci7bghXk5leV/jxWLzS
         6ViQ==
X-Gm-Message-State: AOAM533nIOo5HeTGnVbJJRQiLZf+EMad4kiwqhpcl5/CZRKTylBx0yJm
	5xzwrtF+dJ48zeD7t61y47Y=
X-Google-Smtp-Source: ABdhPJyMfMNtPn/D13pgx8ooxUQkCNfMvFyZXZjYayYzm8HCzqrk4SeQsJCDASAy3EEwakR32Lzm2A==
X-Received: by 2002:a17:90a:b797:b0:1e0:ad13:ef39 with SMTP id m23-20020a17090ab79700b001e0ad13ef39mr32233871pjr.8.1654057062682;
        Tue, 31 May 2022 21:17:42 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id u11-20020a63d34b000000b003c14af505f6sm290749pgi.14.2022.05.31.21.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 21:17:42 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Rob Herring <robh+dt@kernel.org>,
	Rayn Chen <rayn_chen@aspeedtech.com>
Subject: [PATCH v2 0/2] Add i2c clock manual tuning feature for aspeed-i2c driver
Date: Wed,  1 Jun 2022 12:15:10 +0800
Message-Id: <20220601041512.21484-1-potin.lai.pt@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, Patrick Williams <patrick@stwcx.xyz>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Current aspeed-i2c driver could calculate a suited clock divisor and
high/low cycles automatically, and it try to assign high/low periods with
close number of cycles.

Because of board schematic design, sometimes we need to manual tune i2c
clock timing register to get longer high clock cycle to match hardware 
requirement, which is not supportted in current driver.

In this patch series, we add new properties for manually assigning clock
divisor, high clock cycles and low clock cycles.

LINK: [v1] https://lore.kernel.org/all/20220530114056.8722-1-potin.lai.pt@gmail.com/

changes v1 --> v2:
* update bt-bindings documentation
* use meaningful values for properties instead of acture value in register

Potin Lai (1):
  aspeed: i2c: add manual clock setting feature

Potin Lai (1):
  dt-bindings: aspeed-i2c: add properties for manual clock setting

 .../devicetree/bindings/i2c/aspeed,i2c.yaml   | 44 ++++++++++++++
 drivers/i2c/busses/i2c-aspeed.c               | 57 ++++++++++++++++++-
 2 files changed, 100 insertions(+), 1 deletion(-)

-- 
2.17.1

