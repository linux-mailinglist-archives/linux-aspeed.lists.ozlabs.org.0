Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD55545BDC
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jun 2022 07:50:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LK96R2qltz3bnS
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jun 2022 15:50:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jHR51n/r;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jHR51n/r;
	dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LK96D6FjVz3bmQ
	for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Jun 2022 15:50:10 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id n18so21989189plg.5
        for <linux-aspeed@lists.ozlabs.org>; Thu, 09 Jun 2022 22:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=CyWSAedHHH8WOxnS1FteZqFj5RO4XNsT/w2yY6pNZrc=;
        b=jHR51n/rBZXorS4PRtas+KNzJoLw6JfmAVpo03Uz8XvakGqSmLngXbqd9fTuRdA9Mr
         SUJiTBmkgQqspCzny5lDbppvFmIb4xmVCwdwq4KaC4L8VKtAHugPVxQVarHYSjtI2h7A
         4zPxthNNKz5glgSA0Wv3fIbM3s1VdBIoWclgU+TE9GX1SYQ+PF1Psu/S0FetKS5t47zH
         RccexJgGc1JV5kSPLo1qn9xb1M+u21KSVNu6OiwNN4z3twy3whbFGeX5SEo568BRRVnZ
         yRNqshxv8YKAsFL1nKnoUsDOh58GMLwJ1edKiLjpMXlXvsxUJMM337c29gyT52dlRehf
         T1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CyWSAedHHH8WOxnS1FteZqFj5RO4XNsT/w2yY6pNZrc=;
        b=plPSp82WRc0kERlu9CQFCtmu+17Y6Nbqz52rsxLMMItcnBXQdmrBmpmvTMtKxbfBZX
         kaz7zJGQONZ7ZfgwM9rPBYtJfvQvh0+2xWY3nMcXxJAswFyuefX3znzjh4kgegjAIN/x
         wJOhsKhY0BoxZZACT6LKEcPA/o9xAkedL/qN8o5AexTGjIU2xM29/TQjNpzFPNqiG3vp
         ipfkoUrFF2CzlCJmEAA3ifRnQXHVTFIiH/rYKtIfe3m2uouizeHWDotdD7WSxVV9glO2
         OEyWtvlwLxRHp73wJI76nIsE1zHq+e54KppxtODNrEmfLXYzE/Rilp/Gm8xVRfWMKjjE
         pmkQ==
X-Gm-Message-State: AOAM5330PQUbbwirFyMLLvY8xyKNL5oBuBSucLGOUiB5LZUKlLvZtIv8
	kFGTHWBpCfCSU9frgeUPssk=
X-Google-Smtp-Source: ABdhPJxVzUr7NUgjQryDfxWm2iEgiYJMjWQvXvaoZfjKjxdgdkHJ5HjzaHdIlY3E5Izq5281au1t4w==
X-Received: by 2002:a17:90b:4b0a:b0:1e8:6ff0:7ec1 with SMTP id lx10-20020a17090b4b0a00b001e86ff07ec1mr7096038pjb.212.1654840207358;
        Thu, 09 Jun 2022 22:50:07 -0700 (PDT)
Received: from potin-quanta.dhcpserver.local (125-228-123-29.hinet-ip.hinet.net. [125.228.123.29])
        by smtp.gmail.com with ESMTPSA id f11-20020aa7968b000000b0051b90ac6c15sm18553977pfk.125.2022.06.09.22.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 22:50:07 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Rob Herring <robh+dt@kernel.org>,
	Rayn Chen <rayn_chen@aspeedtech.com>
Subject: [PATCH v4 0/2] Add a property for setting minimum persentage of i2c clock high
Date: Fri, 10 Jun 2022 13:47:20 +0800
Message-Id: <20220610054722.32229-1-potin.lai.pt@gmail.com>
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

Introducing i2c-clk-high-min-percent property for setting minimum
persentage of clock high.

This driver will go through base clock divisor and calculate a set of
high/low clock with duty cycle applied. if driver could not find a suit
high/low clock set, then it will use default duty cycle (50%) recalculate.

LINK: [v1] https://lore.kernel.org/all/20220530114056.8722-1-potin.lai.pt@gmail.com/
LINK: [v2] https://lore.kernel.org/all/20220601041512.21484-1-potin.lai.pt@gmail.com/
LINK: [v3] https://lore.kernel.org/all/20220607163703.26355-1-potin.lai.pt@gmail.com/

changes v3 --> v4:
* rename property to i2c-clk-high-min-percent

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

 .../devicetree/bindings/i2c/aspeed,i2c.yaml   |  7 +++
 drivers/i2c/busses/i2c-aspeed.c               | 56 +++++++++++++++----
 2 files changed, 52 insertions(+), 11 deletions(-)

-- 
2.17.1

