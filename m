Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E32FE57982
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2019 04:34:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z3qq6LnPzDqd7
	for <lists+linux-aspeed@lfdr.de>; Thu, 27 Jun 2019 12:33:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2a00:1450:4864:20::143; helo=mail-lf1-x143.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="ESM1J+uC"; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z3qf28CLzDqcT
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 Jun 2019 12:33:48 +1000 (AEST)
Received: by mail-lf1-x143.google.com with SMTP id a25so471734lfg.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 26 Jun 2019 19:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AZTXmvXr0MWnVP8mYRp82nMN6DVuJ1dopWZlM0gQIj8=;
 b=ESM1J+uCB2a403PXxrQVk7yXkv0gynrduWQJCZbsZKcJF7c0JhLjjsg0t90wiP7PBj
 dEJYGoGMZFoPepm0Be5TrMXHd3A3g1bf0XOjjIQBThrMpyvhTfGXP81fzk0rsEaB23nh
 Wp7ecpJ6ewdma0DXD3n8TClsj8Xchwcf+zYIFUCrLSGA8JpCwqmdNwEaz7nhwuWPbF/F
 IETlzC6i/BK9ha1P/roGicqnajHFitzQ+zvCPqES5XvoHsysVxkuUYsxCFAGrdZhdTJv
 CRNin+Ey8QeTIYTFQZOetxlpq6q06uXNEJqLMCiknYw7R6qA8oDduq8qj2QrhFfQ1TR7
 Fu/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AZTXmvXr0MWnVP8mYRp82nMN6DVuJ1dopWZlM0gQIj8=;
 b=cFCfz4FSXoC3yF1+SMlwbCeNqEqfx3CpRzHU2VxSX8/Pz4mCdYE6O8fJ1ujycVN3s5
 NzVUZG0WZzrPEc13Nw8+DM9AUhUPvLZwEQTZMYi2F2kvRu7OvdIUXbHw81fLWbDLnpVg
 S9rxOenHciFEc6RjCoKJDFUzOjPrcjd0AyBqsaa1rWU1fhINizci9WNtEfhTlcZ92giD
 m/y+1GFrzPq8EgMznGxCkEfc6hf0T38qxIG7b6gnMLwdPyFsDEIoI/slWTEJk5ghD9Pu
 FHscg640vfDoqcNa7srGJPH5ElbiRaD1N2lZ7ZvPOPnSZrQ1IkrKNfEwMphzyzwFTXkB
 y2ZA==
X-Gm-Message-State: APjAAAWbEmDhtW0XxGcB3eMv3bQjg45ZmwyBajTsDf0mFEDX6jdOyGTd
 ORDYEmeFJKD6Mk3kUpgZmuBqGQ==
X-Google-Smtp-Source: APXvYqyMnKJm3WFO7Y7nqNNd4BOZBLnGjntyaizVhMTRPh3lYD0ZAjplTZ06cxg4KCYrMVfj9O+fpA==
X-Received: by 2002:a19:6602:: with SMTP id a2mr629644lfc.25.1561602822023;
 Wed, 26 Jun 2019 19:33:42 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id n3sm109277lfh.3.2019.06.26.19.33.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 26 Jun 2019 19:33:40 -0700 (PDT)
Date: Wed, 26 Jun 2019 19:18:08 -0700
From: Olof Johansson <olof@lixom.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: defconfig changes for 5.3
Message-ID: <20190627021808.47q4n4bhrj75hxzw@localhost>
References: <CACPK8XfL-U-BeynGQNBp5rPiv1gzD=7DVzyvrgtoL3njU1Kr_A@mail.gmail.com>
 <CAOesGMjTBazjfMYEKww_dGuFAZYa7f6JBZDoyyCNaWKvKdpbQw@mail.gmail.com>
 <CACPK8Xf=vb4To_fxpJiaT-is3BBGg1SUsAc1qtFrBd-FwmPXRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xf=vb4To_fxpJiaT-is3BBGg1SUsAc1qtFrBd-FwmPXRA@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: arm <arm@kernel.org>, linux-aspeed@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jun 26, 2019 at 02:03:45AM +0000, Joel Stanley wrote:
> On Tue, 25 Jun 2019 at 13:18, Olof Johansson <olof@lixom.net> wrote:
> >
> > Hi,
> >
> > Looks like the multi_v5_defconfig changes aren't producing the results
> > you're probably expecting -- unless the drivers are pending in
> > linux-next?
> >
> > arch/arm/configs/multi_v5_defconfig:257:warning: override: reassigning
> > to symbol ASPEED_LPC_CTRL
> > arch/arm/configs/multi_v5_defconfig:258:warning: override: reassigning
> > to symbol ASPEED_LPC_SNOOP
> 
> Oops, sorry. I made a mistake when preparing the change and missed the
> warning when testing. We now have two copies of each of these options
> in the defconfig (they moved around due to misc -> soc movement).

No worries!

> I've sent a follow up patch for you to apply directly. Let me know if
> that's okay, otherwise I can do a new tag.

Patch was fine, applied.


-Olof
