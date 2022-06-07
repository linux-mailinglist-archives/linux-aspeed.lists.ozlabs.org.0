Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FFA5403EF
	for <lists+linux-aspeed@lfdr.de>; Tue,  7 Jun 2022 18:39:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHbg54HPdz3bmS
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Jun 2022 02:39:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KIKbOB4w;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KIKbOB4w;
	dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHbfy3VzTz3bkk
	for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Jun 2022 02:39:37 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id s14so15261356plk.8
        for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Jun 2022 09:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=MMsXwp0wncXVlQhEOdDSIGnh/k5pLZa/8LV3fqGCk4Y=;
        b=KIKbOB4wieeuMpPaO4+32G+4O/nY09/u19Hqx4jPcpRklBIHv2pGAdhO1sQC919tqD
         NDH4+9zXCSW0mRmdCh/7PSXshbx4o0PDMEieI3ug6oYly+Y6IHZoreB1ONVcYCRJhWvF
         SR6PP+uhXWFry/W5JVfWBl5xTF6wXJcMIt76Nt3bkIKvt8VBhN29upjxcjONcAn9QLE+
         lWjCZ1G826QU7OO3kpgh8vE/sigSZehnXmu/DXLREfk1V5buNv4/PBT35ez61pRAom3D
         RteKFqjdRcjWzcMLhx2XeHk656GOqb+/22zVFV4ZOfAL82uPf+DTqpzmWMjV7cMNI9p2
         LJGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MMsXwp0wncXVlQhEOdDSIGnh/k5pLZa/8LV3fqGCk4Y=;
        b=WrRLgcvZm1dgZflXJtfzcnNOUQwTvA3AbQg+tiAPgHL7+qreFk94ETw3GKi0Am7S+L
         CWcT8MCewRixSjCEGJbJ30MNCNtS0143ZXsqCXc5fmcry0HIiARulDvJke2J6lABBJI6
         gvZVA5RPn++23QLPB+yMWsWsusZTVSZqWAsDqDsLfpqGOzhmxfUItIKxEf8bwd906ZQZ
         Cb3J/SYJpxbhMcLzBq1mxJsWYv4YjOiCmMCm/BqEf3SjP1roZ64RrqXft7zFgI5yerzT
         m+LVFGVjFbo9/wR0noBU34raiZFh70Rjul0rj3gVn7ecGwlyKa29WxN2j1NnwNZGtQIn
         PtOw==
X-Gm-Message-State: AOAM531LA2sfFhuQELrl4t1vIfSFmE4q+ttYQN9yXy7byjfipiN/ZwAE
	XoO7/BmAvbkYX+91FpgodIw=
X-Google-Smtp-Source: ABdhPJwNz5IykOxSZ49GvZQ67utgu7Sq19F/1tUevm/gmcskQusvlJdzF1E9V8CoEor0rp7A6HBZsQ==
X-Received: by 2002:a17:90b:2247:b0:1e8:9f24:269a with SMTP id hk7-20020a17090b224700b001e89f24269amr5405690pjb.14.1654619974077;
        Tue, 07 Jun 2022 09:39:34 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id d15-20020aa797af000000b0051bbc198f3fsm12560272pfq.13.2022.06.07.09.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 09:39:33 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Rob Herring <robh+dt@kernel.org>,
	Rayn Chen <rayn_chen@aspeedtech.com>
Subject: [PATCH v3 0/2] Add i2c clock duty cycle property for setting minimum persentage of clock high
Date: Wed,  8 Jun 2022 00:37:01 +0800
Message-Id: <20220607163703.26355-1-potin.lai.pt@gmail.com>
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

Introducing i2c-clk-duty-cycle-min property for setting minimum persentage
of clock high. 

This driver will go through base clock divisor and calculate a set of
high/low clock with duty cycle applied. if driver could not find a suit
high/low clock set, then it will use default duty cycle (50%) recalculate.

LINK: [v1] https://lore.kernel.org/all/20220530114056.8722-1-potin.lai.pt@gmail.com/
LINK: [v2] https://lore.kernel.org/all/20220601041512.21484-1-potin.lai.pt@gmail.com/

changes v2 --> v3:
* discard the properties for manual setting, use duty cycle to calculate
  high/low clock.

changes v1 --> v2:
* update bt-bindings documentation
* use meaningful values for properties instead of acture value in register

Potin Lai (2):
  aspeed: i2c: add clock duty cycle property
  dt-bindings: aspeed-i2c: add properties for setting i2c clock duty
    cycle

 .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  8 +++
 drivers/i2c/busses/i2c-aspeed.c               | 56 +++++++++++++++----
 2 files changed, 53 insertions(+), 11 deletions(-)

-- 
2.17.1

