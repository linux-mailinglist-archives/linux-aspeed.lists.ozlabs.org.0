Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AA74D9245
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Mar 2022 02:27:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHbP24FFsz30Km
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Mar 2022 12:27:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=F7WlOKX8;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::829;
 helo=mail-qt1-x829.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=F7WlOKX8; dkim-atps=neutral
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHbNx2hJWz2xXV
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Mar 2022 12:27:11 +1100 (AEDT)
Received: by mail-qt1-x829.google.com with SMTP id t7so4190511qta.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Mar 2022 18:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+V4iyUGPnF/NQhkHTPBkqtdb3tsV1eLSkglbcthvJjk=;
 b=F7WlOKX8QUi+Ggrzwp05RoLUrZK+fo2HnWaEve3xfgNOcc+YuoLVSG+IG0CR+xUgog
 QnPZzCtz76OykGAtwKL/2hT4biTkPTPhOoIbbu5iWjDi2fTNbXWq7Y9tznrrexq98h4E
 6/eg/XUSas7Az8p0fA2W2jBAEVL8xLswQ3X2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+V4iyUGPnF/NQhkHTPBkqtdb3tsV1eLSkglbcthvJjk=;
 b=6dtKVTvr9OZBckp3zLn6kiExk7+6XScI77Ct1xvtTmLlJ5VJGKzm3zqhHNsyWkqupz
 eMVSt+wdcnrXzfzkO4lwIJCsW2ysZeKwLi6fabmQwg+qB4t8+x2G4pN4ZQNJJMDpvVWi
 2Mijk+mpP/bO76lA3bhUx2OVDcxH5uQDEhgrDEvZ1sbHbulWs0tDgvWgtyiBS9F1Kq3a
 qndaFoxVtX0DWM5iIHjkwo7qtOGqARInxVmUehFaZ2cB9NBkH3T5TE94Qttlj9l3ivyw
 QntCUxACz1KH6BJrBD4Kg0DAZ1nZVSvfFfF/x8xMlDzNe9J5ilKL7ik/+xz8xAlM9QJC
 N7sQ==
X-Gm-Message-State: AOAM533rpP98T/pXmtnXJRR+cKRH8FXAKdSoRkeQRytcLzQIGERUw5Qc
 RSjCT7cNDs5NkFtmlFLIwhzQLxTOIHOdL3vG5/M=
X-Google-Smtp-Source: ABdhPJzE6usGxaJAkzghzKID06dDa9XcVgDlW8+O+LojgMNzBWy91SSpCcSY5Qmt4oRq5XcbaMVucMXmRSpOpfRYl8k=
X-Received: by 2002:a05:622a:14c8:b0:2e1:d626:66ea with SMTP id
 u8-20020a05622a14c800b002e1d62666eamr4668263qtx.58.1647307627925; Mon, 14 Mar
 2022 18:27:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220304000311.970267-1-joel@jms.id.au>
 <20220304000311.970267-2-joel@jms.id.au>
 <CACRpkda3q=Rh7Kmi8Cycg4CAYUhzpRxLf+ErwxR_0drtTNTr+g@mail.gmail.com>
In-Reply-To: <CACRpkda3q=Rh7Kmi8Cycg4CAYUhzpRxLf+ErwxR_0drtTNTr+g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 15 Mar 2022 01:26:56 +0000
Message-ID: <CACPK8XetyrHHmpbSiE3rXgtdQt9JTg_ZHfuFhsyOoWdSrCvk=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: aspeed: Update gfx node in
 example
To: Linus Walleij <linus.walleij@linaro.org>
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
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 15 Mar 2022 at 01:21, Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Mar 4, 2022 at 1:03 AM Joel Stanley <joel@jms.id.au> wrote:
>
> > The example needs updating to match the to be added yaml bindings for
> > the gfx node.
> >
> > Signed-off-by: Joel Stanley <joel@jms.id.au>
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> I guess you will merge this elsewhere or shall I apply it to the pinctrl tree?

Feel free to take this one.


>
> Yours,
> Linus Walleij
