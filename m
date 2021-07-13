Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 578543C79CC
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Jul 2021 00:44:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GPbKd2HHhz3066
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Jul 2021 08:44:21 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.52; helo=mail-io1-f52.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GPbKY3QF0z2xy3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Jul 2021 08:44:16 +1000 (AEST)
Received: by mail-io1-f52.google.com with SMTP id u7so29219331ion.3
 for <linux-aspeed@lists.ozlabs.org>; Tue, 13 Jul 2021 15:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/1Qu7cMHa9uzbYo7ijXv1POZZirJoa4gkML3s+GgcbM=;
 b=dF5OOwVVvDyS4wODVVOPS/wPpXr/PLhl/83urMNU4ibVuDr51gTwiO0NlpgEkRXMHp
 DJ16EHpKmwcAoJ+9uDMgY0rsXPERO0kWamEa321knTpdnNZ60305j/GX4gs2fLnkMV+R
 ArjBHntUR+r+IsW9V7ZKbYHduDh+fUUpS4jRka3DdvOKTeqMi0yQJosr/e9OJQ053+QZ
 y+yG9IQmsCtwMWu+TsBEOrbSgUVzSdP4tqT0vGeoa8Xr2XroXLuOE4uxk9Gxd6CXsSEg
 Uuyd+NdusbF0abfVPvBVhDnYEBIlciPJS5IjLemzc7TD8ZIbISjDtxAHVXxEdoZtwq/M
 5WsQ==
X-Gm-Message-State: AOAM533k+GoGQUl5y4kzwov+Uop8061ZYUwIz0o1Mx6+WuZe2UQ7q5CC
 dK6ppBdXii74b7FYmpJ/xw==
X-Google-Smtp-Source: ABdhPJzvmAfJKZ7SSfXPpwfF6OxiNSXzxMH5ZbpeWkU8qDr2LMSI2feSX2xxnpi1I9TrTAAvde/cuQ==
X-Received: by 2002:a05:6602:8c3:: with SMTP id
 h3mr4877942ioz.144.1626216254403; 
 Tue, 13 Jul 2021 15:44:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id c19sm193611ili.62.2021.07.13.15.44.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 15:44:13 -0700 (PDT)
Received: (nullmailer pid 987828 invoked by uid 1000);
 Tue, 13 Jul 2021 22:44:10 -0000
Date: Tue, 13 Jul 2021 16:44:10 -0600
From: Rob Herring <robh@kernel.org>
To: Steven Lee <steven_lee@aspeedtech.com>
Subject: Re: [PATCH v6 2/9] dt-bindings: aspeed-sgpio: Add ast2600 sgpio
Message-ID: <20210713224410.GA987786@robh.at.kernel.org>
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
 <20210712100317.23298-3-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712100317.23298-3-steven_lee@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Hongweiz@ami.com,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 12 Jul 2021 18:03:09 +0800, Steven Lee wrote:
> AST2600 SoC has 2 SGPIO master interfaces one with 128 pins another one
> with 80 pins. Add ast2600-sgpiom compatibles and update descriptions to
> introduce the max number of available gpio pins that AST2600 supported.
> 
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> ---
>  Documentation/devicetree/bindings/gpio/aspeed,sgpio.yaml | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
