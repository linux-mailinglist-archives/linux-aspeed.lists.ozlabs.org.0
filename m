Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8B24CC828
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Mar 2022 22:36:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8knD2MMYz3c3Y
	for <lists+linux-aspeed@lfdr.de>; Fri,  4 Mar 2022 08:36:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=d4iSdfFL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::836;
 helo=mail-qt1-x836.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=d4iSdfFL; dkim-atps=neutral
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8kn51CVfz3bbm
 for <linux-aspeed@lists.ozlabs.org>; Fri,  4 Mar 2022 08:35:53 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id s15so5814468qtk.10
 for <linux-aspeed@lists.ozlabs.org>; Thu, 03 Mar 2022 13:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L1Q9sdnTqYlZlLU7twPdWgz9bcNxdvX07ZYQ1tXE7K4=;
 b=d4iSdfFLz79BntOhrp2p23HpQHlgolCX34pjwXD+Bt64bl6GqMOLNaU7D0XXuJYsI0
 +yY46c+Q+80iklOBa6DgVfWb+h2jyvOtLH4TaaK3dxZ1SEeoAtTj4zw2Ug4CQR1dN11F
 Ws8OWXekp6+7uJFhnPWiATWP6JI95i0+Tke3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L1Q9sdnTqYlZlLU7twPdWgz9bcNxdvX07ZYQ1tXE7K4=;
 b=BmcElt6P5it9pXaUstS3RLAHDMJn8wNzIGFnCHXAknury/z73aIbmY5+c5CSWZn3bo
 BnHtzJGFYkYOrwlzD/zSAguZQvltllsLtuCQiFDMlBfHobLfGwxqmRbtd/nvx2r1wRMh
 6cWnYxl5Pd2piCaZ1MV8rALlRdlLVFtRNhHz8niZtl6qM9Ai1A6f26mi075gnh85zK3o
 UeUi0pv6gclXZxGKuj3Wvkha26DXSvXldvod2cEG0XoeioLa2364OmgzCHNv+Iv+mtUg
 k13wtbI/KhAYU74kte5cnOvL89KbLnVwh9Ky8pDiHy9eHqSewkhpHhYX4VwgqkPiSkEL
 zdvw==
X-Gm-Message-State: AOAM5320bONs0974QwDtKrFQucTE8+toDEl4QX3efudCR90+Y/JnFUeN
 zchM2uu7OJCrzWnVRdnRA2mg++VX7vM3czw5ELk=
X-Google-Smtp-Source: ABdhPJx1dtBQ1EOQRQQ2DfFAxZ+hxlYYPAxznboh4jmMsmSM2GTXYrz2DJR6SYcMuO7VVOrl354ZqMz2TfqnaZuFIUs=
X-Received: by 2002:ac8:5b82:0:b0:2cf:232d:b1f8 with SMTP id
 a2-20020ac85b82000000b002cf232db1f8mr29367893qta.58.1646343348365; Thu, 03
 Mar 2022 13:35:48 -0800 (PST)
MIME-Version: 1.0
References: <20220302051056.678367-1-joel@jms.id.au>
 <Yh+w7+CdtYYJoRkh@robh.at.kernel.org>
 <CAL_Jsq+zDTfZaYf3H98rub8e-fSmtFFQ_ok=cQ3bqPojx0_Ckg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+zDTfZaYf3H98rub8e-fSmtFFQ_ok=cQ3bqPojx0_Ckg@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 3 Mar 2022 21:35:36 +0000
Message-ID: <CACPK8XfYRHTPz50wgNp7Q0Pi4rKVag9-bLD7kHcyKrHwHdKW7A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpu: Convert aspeed-gfx bindings to yaml
To: Rob Herring <robh@kernel.org>, Andrew Jeffery <andrew@aj.id.au>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 3 Mar 2022 at 19:34, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Mar 2, 2022 at 12:01 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Wed, Mar 02, 2022 at 03:40:56PM +1030, Joel Stanley wrote:
> > > Convert the bindings to yaml and add the ast2600 compatible string.
> > >
> > > Signed-off-by: Joel Stanley <joel@jms.id.au>
> > > ---
> > >  .../devicetree/bindings/gpu/aspeed,gfx.yaml   | 69 +++++++++++++++++++
> > >  .../devicetree/bindings/gpu/aspeed-gfx.txt    | 41 -----------
> > >  2 files changed, 69 insertions(+), 41 deletions(-)
> > >  create mode 100644 Documentation/devicetree/bindings/gpu/aspeed,gfx.yaml
> > >  delete mode 100644 Documentation/devicetree/bindings/gpu/aspeed-gfx.txt
> >
> > Applied, thanks.
>
> Uggg, now dropped...
>
> What's Documentation/devicetree/bindings/mfd/aspeed-gfx.txt and also
> the example in Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml?
> Please sort those out.

I think the aspeed-gfx.txt can be deleted. And the example in the
pinctrl bindings needs to be updated with the required properties.

Andrew, can you clarify what's going on with those other files?
