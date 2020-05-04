Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C67C51C39BC
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 May 2020 14:44:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G2ch70bZzDqc9
	for <lists+linux-aspeed@lfdr.de>; Mon,  4 May 2020 22:44:52 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::641;
 helo=mail-ej1-x641.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=mDnyGV9v; dkim-atps=neutral
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G2cS4VfXzDqTQ
 for <linux-aspeed@lists.ozlabs.org>; Mon,  4 May 2020 22:44:37 +1000 (AEST)
Received: by mail-ej1-x641.google.com with SMTP id pg17so13742370ejb.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 04 May 2020 05:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KvTx81p1Or0dC1AYdpQVhyeYDLLZOkvh0mdzl023l7M=;
 b=mDnyGV9vyqN4qdNFSgPodWfKAeIJdsnzLWCVE8hkdcgscKtJcmm+zWzb5sIPtxxFbW
 cTqYaxtqfa9KGeCG5wazeiWXdHFyxOAL2+z0npBw40wxhWLJWQl0H/Q2z3hpJyZcw4hy
 aRDSBJ7r82H61YpnPyuDlgWBQEmRvXn2MX5EE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KvTx81p1Or0dC1AYdpQVhyeYDLLZOkvh0mdzl023l7M=;
 b=MZ3UddOTZ6+9+MMF0GgVUrIIZAejcEG0AF2tCwhm8A8HBlQmFvTmQL7imNO58mlOm2
 b8QbzHQwuh5RjUNXTrVBhEXRVQIHcjFkTinJDsFUyEpbLWPBPLJpOlOj7mpsB633Zuh2
 cGEQ6nzJc9IYzwipDkGZUgXOAhDwpSLgCwWdmYlB123IVg6P9VjhbAsKlUFnquFi4rPh
 xXzSGn9U5XFhJrNe+3vdCeKlCgZ62seR8qXLuh4Y6N1kZ62Gt3/YM5PQ1p8jkyoLeZwj
 NoW0zJq7IpdAyu5+9GBbtE0+OP1j/41MK8IF2I1K7Nnkkrhn1rhW/ruGXhyn8g0ErXi0
 fCCQ==
X-Gm-Message-State: AGi0PuaT/cVWPzHU13r2NktXRVY0RNkctns9KerDE8mtvMhqmfztWUjt
 0rkDAF0w9/ItyJV8A/izPDaxh60N4UOzIM3f7Bo=
X-Google-Smtp-Source: APiQypKejwm/lQkWQj4iWmwktQXWSonZw9Wd0eQ/NGcxoYqEAKwt5FFlvQ4MvtMF3OCEEc0RhtVTDF2rQMF4pnE6tDU=
X-Received: by 2002:a17:907:43c2:: with SMTP id
 i2mr14786264ejs.185.1588596271042; 
 Mon, 04 May 2020 05:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200424135303.20952-1-a.filippov@yadro.com>
 <CACPK8XcP3V=8fAUfNvRFqPU9G38dGR43Kpp=Uxm=P_AjrMnzBQ@mail.gmail.com>
 <c1de0c90-d486-4855-bb26-0f3cc416b05d@www.fastmail.com>
In-Reply-To: <c1de0c90-d486-4855-bb26-0f3cc416b05d@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 4 May 2020 12:44:19 +0000
Message-ID: <CACPK8XezSFzCeQN4tkvcmjOHEAgrRGYBiBzRymaazpv8Lh-gTQ@mail.gmail.com>
Subject: Re: [PATCH v5] ARM: DTS: Aspeed: Add YADRO Nicole BMC
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "Alexander A. Filippov" <a.filippov@yadro.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 4 May 2020 at 11:04, Andrew Jeffery <andrew@aj.id.au> wrote:
>
>
>
> On Mon, 27 Apr 2020, at 20:41, Joel Stanley wrote:
> > On Fri, 24 Apr 2020 at 13:53, Alexander Filippov <a.filippov@yadro.com> wrote:
> > >
> > > Nicole is an OpenPower machine with an Aspeed 2500 BMC SoC manufactured
> > > by YADRO.
> > >
> > > Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
> >
> > This looks good to me.
> >
> > Andrew, do you have any comments before I merge?
>
> Not other than muxing all the ADC lines to enable just one seems a bit strange,
> but Alexander mentioned previously that the rest were simply grounded so it's
> not going to cause any problems in practice.

Thanks. Can you say the magic words for patchwork to pick up?
