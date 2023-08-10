Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7219A776FE3
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 07:58:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qkSqzV7Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RLx7X2Jt7z2ysB
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Aug 2023 15:58:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=qkSqzV7Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=rentao.bupt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RLx7S24bdz2yZX
	for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Aug 2023 15:58:42 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-686b643df5dso391164b3a.1
        for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Aug 2023 22:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691647119; x=1692251919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aPFtNvyvLCrgV2MxecvIBM/JYmJP7ZKguh4I0qUa+pI=;
        b=qkSqzV7YtqTTnf5pWK4aEUCnGrWCjx9BqYyxmChB6Vhg0ecnJ9pPWGPvoA9NTKH/yL
         GpuhIY6h09S0eRJtnBo38uctwFNUVtzHSNieMz1mWEnYjO4jnOOv5gbeS/WPCbqhfsoW
         tURptAMUN080JtwnXhoqZ7qtOtRKy4HS2gLi8mUBuXOHqukH6bBImO48vS2eI0II5bpi
         gDKTZes17bOsfDDSswLvQ0sJUdAydE2qwk9PIVRjlx6uAIAXQbglDTZI+B0tRUKRJwI4
         /dTOl2GCtJ7J2aHinf1dK5E8qf/9Uty5pksqlMSrHdDPNYpp0sgKDJL9YmarqGCvttFe
         0mXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691647119; x=1692251919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPFtNvyvLCrgV2MxecvIBM/JYmJP7ZKguh4I0qUa+pI=;
        b=JeK3vS1el+KgLlY95k9s92J4bBg4sdAn0XW1/MiLCJEqtI8JkmRpfbPljxBv59+UQw
         nRZqk0T2C0HRI4z5Y1geeqmySnmFbSn41xlSNJ5DAuhtfCCPd0BMi6+PWYWkb8tb3jpa
         r/Xug9nUWr7eAqVQdfT5Mm595shwaRPcvelgKQOOvvPfF8ZyaDTQvSvHQsvfKutqJGMs
         VjXqxw+sU1E6m6aS4ZC+Pd7Fg0/bMinf3YuzBnpRuaQfEP72uvXxyy3QR6U9QeIxNmS0
         bw4m5fJ7a9Ni/anS3blU/5zoX+M6HuXvsATDa9ASJarTQmTkUd5gREfAmhUYTZOeVHE2
         BvGA==
X-Gm-Message-State: AOJu0YyGYarJk3nwEZYt13tHMA7pl3SL1U1FdcHeKzFD3mkeqwHrmyWJ
	dGCkUQqkazG+EZjQrsgjbk0=
X-Google-Smtp-Source: AGHT+IFtlIS9rOUoW0nRYv/rU5x45L1e4xM0I6tfde6WoFCs/6kXCWXJvJdatNuwNCUYkr+ONZgkNQ==
X-Received: by 2002:a05:6a00:3a10:b0:686:ec1d:18e5 with SMTP id fj16-20020a056a003a1000b00686ec1d18e5mr1376222pfb.28.1691647119137;
        Wed, 09 Aug 2023 22:58:39 -0700 (PDT)
Received: from taoren-fedora-PC23YAB4 ([76.132.59.39])
        by smtp.gmail.com with ESMTPSA id k19-20020aa790d3000000b00682bec0b680sm613056pfk.89.2023.08.09.22.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 22:58:38 -0700 (PDT)
Date: Wed, 9 Aug 2023 22:58:35 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: Fixup Wedge400 dts
Message-ID: <ZNR8i5DCNSthmgTZ@taoren-fedora-PC23YAB4>
References: <20230803230324.731268-1-rentao.bupt@gmail.com>
 <CACPK8XcFL7kM1yaA0+ZRSt27a0yreO+AH5cXtSk1TyjqyjH1WA@mail.gmail.com>
 <ZNR21UVdfxlvpZAt@taoren-fedora-PC23YAB4>
 <CACPK8Xd7LpMuVC63PSfcLmXf4wRThMNRYr9vRxZh246+-DUFFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xd7LpMuVC63PSfcLmXf4wRThMNRYr9vRxZh246+-DUFFA@mail.gmail.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, taoren@meta.com, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Aug 10, 2023 at 05:37:41AM +0000, Joel Stanley wrote:
> On Thu, 10 Aug 2023 at 05:34, Tao Ren <rentao.bupt@gmail.com> wrote:
> >
> > Hi Joel,
> >
> > On Wed, Aug 09, 2023 at 08:08:12AM +0000, Joel Stanley wrote:
> > > On Thu, 3 Aug 2023 at 23:03, <rentao.bupt@gmail.com> wrote:
> > > >
> > > > From: Tao Ren <rentao.bupt@gmail.com>
> > > >
> > > > The patch series fixes a few entries in wedge400 device tree.
> > > >
> > > > Patch #1 sets spi alias in ast2500-facebook-netbmc-common.dtsi (included
> > > > by wedge400 dts) to make sure spi bus is consistent with flash labels in
> > > > flash layout.
> > > >
> > > > Patch #2 enables more ADC channels in wedge400 dts.
> > > >
> > > > Patch #3 sets eMMC max frequency to 25MHz in wedge400 dts.
> > > >
> > > > Tao Ren (3):
> > > >   ARM: dts: aspeed: Update spi alias in Facebook AST2500 Common dtsi
> > >
> > > I wondered if we should do this in the aspeed-g5.dtsi.
> >
> > I also hesitated if I should do it in aspeed-g5.dtsi, but I didn't do it
> > because I was not sure if others care about the spi aliases.. Should I
> > send out v2 to move the alias to aspeed-g5.dtsi?
> 
> I wasn't sure either. Lets leave it as-is, but if we see other systems
> wanting similar numbering then we can put it in the common dtsi.
> 
> I've applied this to the aspeed tree now.
> 
> Cheers,
> 
> Joel

Got it. Thanks Joel.


Cheers,

Tao
