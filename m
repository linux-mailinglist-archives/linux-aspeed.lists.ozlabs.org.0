Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6376C8A56FC
	for <lists+linux-aspeed@lfdr.de>; Mon, 15 Apr 2024 18:03:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bvpgPTqV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJBmV1Yxwz3dWn
	for <lists+linux-aspeed@lfdr.de>; Tue, 16 Apr 2024 02:03:38 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bvpgPTqV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJBmJ0wNJz3d42
	for <linux-aspeed@lists.ozlabs.org>; Tue, 16 Apr 2024 02:03:26 +1000 (AEST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-41885eeb104so842615e9.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 15 Apr 2024 09:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713197000; x=1713801800; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pr8I+VgFd75ZRE+zHJAA09qQ4BgEHQBbfn3jY2/hZUM=;
        b=bvpgPTqVK44qgv7VwTBDXq5kivywBg5jWsU6V9WdQBylr0wwQgcG/1QN8+xIVv6LYm
         w9vQ0wyPvA6yiQA4S240cSqOLiQp+t78ocq21LBfM0ztYFgo12u0w3urW6w2YHl6i9GP
         ZCa30HjeR3k4XuI3EIIyU4U96nGDJyMgXcrD0V11BVIpvYW1DIMkFa03jEO9frwQsEQY
         QnlLPl998Kl44pLMnNEVAgEnYqtovH/odDwTiIbi3DDFHNyC/gtTIl9xBVBiIt4rdJv/
         xP4/39UrHYHlNpumUgXH3GjaLntEeZk1jLXFtPTI7CCYqkyEL1c3Ee54xwirtfdzLr5V
         25xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713197000; x=1713801800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pr8I+VgFd75ZRE+zHJAA09qQ4BgEHQBbfn3jY2/hZUM=;
        b=DNtikpAGo4h34cJUdtWBa91Y5/lDfOAalNpgq+Lkn9IqmjNxY9qJLGU+ui9Pvabhl8
         InSfEn5B7g7L88bjKe4al070DDwv3nm9uVtXdYOvcA3xdt694yOSxK+8TvPJYkXJEgQb
         NJ4Mt9ADoMlF4syLa/KeBbLS+RxUaNTvamTpGADzBbhiZP9jEWGvUyp/vOB1Usd8A3nj
         6GOgw75d5ims+kqMGw9xoLfORE1Q4adlx8inNyRnXLt6dynEK+KVEjl6cxeZ9Dkp0Y6d
         JhcyUayqEg2E72Jx7Aa0+L3CwMmS0wwK630zQzyVBCyK6cG9mC9DymFQP/11zHwk1QhN
         zQoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtGgzJvRaMSXcLfyJj0AfKfgdPIr3KO7cOItzaQPf1JMHpfwcCaJYHvrwxXA+D8RNu2dIh3yZ6aDB4MFGwJDFdDtOtH12XjeJuLTXggQ==
X-Gm-Message-State: AOJu0YwSJpH5XycUc8/hLnDxzQAV/CP7PB+R0vOMQHHE7Ery3TW6tJOB
	BM6jQv5YmUyy8FC8mlodlLXBYrCRt3zaeU5z5ULKFcehdP2DRfEFU8pMwZnncYDo0XzKNe8QNX2
	rBILf2RuTYYmmCrXGk2TH3xc3bPs=
X-Google-Smtp-Source: AGHT+IGnudFnkfz6Z05cxCNhWfRT6AhTVVqFs+J3nN12T7rpgYsfp9y3+IWYL9AdGU/G7zlxCfw/2BIy9fnGAran+C8=
X-Received: by 2002:a05:600c:1d0a:b0:418:5fb4:20ab with SMTP id
 l10-20020a05600c1d0a00b004185fb420abmr2227743wms.5.1713197000036; Mon, 15 Apr
 2024 09:03:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240412091600.2534693-1-peteryin.openbmc@gmail.com> <3eb80a2f21a96cc0fc275db60631f673bb14e77f.camel@codeconstruct.com.au>
In-Reply-To: <3eb80a2f21a96cc0fc275db60631f673bb14e77f.camel@codeconstruct.com.au>
From: Chia Hsing Yin <peteryin.openbmc@gmail.com>
Date: Tue, 16 Apr 2024 00:03:08 +0800
Message-ID: <CAPSyxFRj0twCJG6Lr5UZpznrUHyd_L0Reo=kZSFwCw3FNQ+x+A@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] Revise Meta(Facebook) Harma BMC(AST2600)
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Sure thing, I will base on version 5 for future modifications.

Thanks.

On Mon, Apr 15, 2024 at 10:00=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Fri, 2024-04-12 at 17:15 +0800, Peter Yin wrote:
> > Summary:
> > Revise linux device tree entry related to Meta(Facebook) Harma
> > specific devices connected to BMC(AST2600) SoC.
> >
> > Base on : https://lore.kernel.org/all/CACPK8XePx+PvDKzPMjPRn_g9z8yrtAmL=
vP8Qbepm1AVjuCbaKw@mail.gmail.com/
> >
> > Change log:
> >
> > v4 -> v5
> >   - Patch 0011 - Add retimer device
> >   - Patch 0012 - Modify gpio line name
> >
> > v3 -> v4
> >   - Patch 0010 - Revise node name
> >   - fixed PDB temperature node name in Patch 0006
> >
> > v2 -> v3
> >   - Patch 0007 - Revise max31790 address
> >   - Patch 0008 - Harma: Add NIC Fru device
> >   - Patch 0009 - Add ltc4286 device
> >
> > v1 -> v2
> >   - Add infineon,slb9670 information for tpm.
> >   - Patch 0006 - Add PDB temperature.
> >
> > v1
> >   - Patch 0001 - Revise SGPIO line name.
> >   - Patch 0002 - Mapping ttyS2 to UART4.
> >   - Patch 0003 - Remove Vuart.
> >   - Patch 0004 - Add cpu power good line name.
> >   - Patch 0005 - Add spi-gpio.
> >
> > Peter Yin (12):
> >   ARM: dts: aspeed: Harma: Revise SGPIO line name.
> >   ARM: dts: aspeed: Harma: mapping ttyS2 to UART4.
> >   ARM: dts: aspeed: Harma: Remove Vuart
> >   ARM: dts: aspeed: Harma: Add cpu power good line name
> >   ARM: dts: aspeed: Harma: Add spi-gpio
> >   ARM: dts: aspeed: Harma: Add PDB temperature
> >   ARM: dts: aspeed: Harma: Revise max31790 address
> >   ARM: dts: aspeed: Harma: Add NIC Fru device
> >   ARM: dts: aspeed: Harma: Add ltc4286 device
> >   ARM: dts: aspeed: Harma: Revise node name
> >   ARM: dts: aspeed: Harma: Add retimer device
> >   ARM: dts: aspeed: Harma: Modify GPIO line name
> >
> >  .../dts/aspeed/aspeed-bmc-facebook-harma.dts  | 107 ++++++++++++++----
> >  1 file changed, 85 insertions(+), 22 deletions(-)
> >
>
> Joel had applied an earlier version of this series to his for-next
> branch. I'm collecting patches targeting it while he's on leave. I've
> updated the series he'd applied to the v5 you've posted here.
>
> Can you please post any further changes as patches on top? You can find
> my branch here:
>
> https://github.com/amboar/linux/tree/for/bmc/dt-6.10
>
> Andrew
