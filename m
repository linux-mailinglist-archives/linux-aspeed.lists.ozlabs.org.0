Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2470898DFAF
	for <lists+linux-aspeed@lfdr.de>; Wed,  2 Oct 2024 17:48:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XJfNj4pQwz2yWr
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Oct 2024 01:48:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727884115;
	cv=none; b=GTL1xGp00G+Sk+jfcR6nAK5i66LltVys0KUQkKgGG52m0caSBkSNcE2g02Jc4hSuFjWFd5nVg8jaMb7w8APMh5rg1gZOIbNghvaPoL9UodvrGTaBzOXVQdrgUPX6rs+4lGhQd8QnKAWdJWQN1Mgyss9KugNLQ9fWSWD/SN+tgM1tNs52TbWJ2Na/MqlgNCWhyF/Nu1RPB4LwMFXSzWaaUHuvLy74/xhYhzwvH61LmnmAQ7wC2nuOMFGFrljIqROgW/USr5KMtBTJsmSTZTn4Et3S/yuAQbpbpIk4hDz+DnYNeZBZCp2gJAB5UlfK7m07uInDPEaM0zOZLJ1ODyPOCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727884115; c=relaxed/relaxed;
	bh=vPpmKPkGsBgRFJIeAW63489wqwk+a4kj5VX3dy2cbbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Df2Bypk/QyV1zVR56EAkPNwT5zR5bQRg3PqkMdWlBlvt0L+h2jX87+uXhOH0mNAwKxxeWOkhA8SwJ9n8zgluyTpJwykzW7SiRFOXcr4guXCFQkYyRcq69PEMcaphnmNeblsOVyan559ufaTJlnh0rCLVRg8qgkdlLR0vI8TX+v0rzrKEtuM/fTYGrzean3N6JAjlw8nmQ9R4gtoKnTJSGrPCQCHeTnVoPp/gG/BIY1DoZh98QDfj1fqRPM86D1HWZ3R93zdkdl9O3TywcYRHM04x8ob+Xd3lckgBOPBqyrGZSxwcfLA5Af7UAV3aqbsm3di5GKA1z16G8USRP67IVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jU7Kn57Z; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=jU7Kn57Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XJfNf28dMz2xF0
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Oct 2024 01:48:32 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2fad0f66d49so50033521fa.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Oct 2024 08:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727884107; x=1728488907; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPpmKPkGsBgRFJIeAW63489wqwk+a4kj5VX3dy2cbbk=;
        b=jU7Kn57ZaIgLYiXj2ZESYlk08uoVSGDF/H8P/WbU8VurdL66voTGJgqnC7BrJx5Y5f
         p8YoB/OKfhxf0phHvkZKkfO78Zptjpl1/igRofFbNi5hacWyGGIKRlvxjI/4bwLNf/9x
         O9/AUf1aT0sdalqkUYvT7l6f+fqPfmqvk7MCQaeynoo4zpseQlNihV3pF6vkmBx2Mrh+
         4XHPg4yTQ73GrvybTdqB741FOgkxs3VbhPNJJBxW5hz5wiNiN6sThy0J1XiDd6d+mnT6
         vRo5yrilOctd0Ab0E4qghH23RD1+X9TUqkna60F9vSa+uG2cyko9JxINB9ODLo4P2fym
         WkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727884107; x=1728488907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPpmKPkGsBgRFJIeAW63489wqwk+a4kj5VX3dy2cbbk=;
        b=kW8iVKpDz+Hgr0hur1gU7gLymlQ8Pi/u61k1F8hV53efuO/I7PqawzXekUak9Ja1mJ
         SrmtiD4Nde1/BeiWcM+K1AHJJdnOMcASINAhS+yiBU2mcIZjP98Q/08R+KJ+D6IwX1/e
         4wBrpSQCOaqoeivxlKwXcuGoitQwz0/JbL0SUfOgizkoc+NCCbklr2bcgKHFiXDgxo7O
         yTooh0PU0MqIbuTv4+52o+qyVAJHuLr/EN97yW/3zZ2MbAclfjrS+A+Ux9eTD//cG5v9
         QnbsgkExEq9gKXRdWlLdJTNXV1fD5PbxSraXBAaGnbDHGx5QC6O4I/McMgVIvXtAXWlc
         vNKw==
X-Forwarded-Encrypted: i=1; AJvYcCU+OPMqwQEjdd7QeXdTAvWji4v7KV0JZ/juXYuZncuS6zbLM3tkwdkMBk86u2QCgNN7RdleP3QkGooXp9g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2D5h7QTsZthVs3AxhUrm7VVWQGIayuCYBgAhR4QhjvTprGbtU
	t++FxQhi0r0xfH8JGjDtTjkZazyliM9X1X0oc6owctUUmjFzq44WXsQDjAnN1+OZ3hmNn+d7srZ
	CVN5PWMd09svRvgts0eS9eeRxWZ8JflPdXGDyjA==
X-Google-Smtp-Source: AGHT+IFtquU+/hcjv4KamAH8Yf+XATK5XoDLh3KzbtFyShyMUx8jgBBNpz1iQXTqzLz0TE6q0aUQe5/IgaOyycvE4tU=
X-Received: by 2002:a2e:a17a:0:b0:2fa:c2c4:f9f5 with SMTP id
 38308e7fff4ca-2fae109ca6emr18835131fa.38.1727884107406; Wed, 02 Oct 2024
 08:48:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
 <20240919094339.2407641-7-billy_tsai@aspeedtech.com> <CACRpkdbFD9CiqVwQ5xxZ9SfQtVvDJGCr=8spxBG4u-JQ0PKJ3w@mail.gmail.com>
 <CAMRc=MdvV7Z2yPpoR9mXLH6UCF5uA=TbkC_qUSj=akP_09M0WQ@mail.gmail.com> <OSQPR06MB7252DF4BB404D5C01785BB5B8B702@OSQPR06MB7252.apcprd06.prod.outlook.com>
In-Reply-To: <OSQPR06MB7252DF4BB404D5C01785BB5B8B702@OSQPR06MB7252.apcprd06.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 2 Oct 2024 17:48:16 +0200
Message-ID: <CAMRc=MdXeRCj9ExsKH31isE9qdbNyC7=nWL=GgORknSZjf7oVg@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] gpio: aspeed: Add the flush write to ensure the
 write complete.
To: Billy Tsai <billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "Jay_Zhang@wiwynn.com" <Jay_Zhang@wiwynn.com>, BMC-SW <BMC-SW@aspeedtech.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Oct 2, 2024 at 5:09=E2=80=AFPM Billy Tsai <billy_tsai@aspeedtech.co=
m> wrote:
>
> > >
> > > On Thu, Sep 19, 2024 at 11:43=E2=80=AFAM Billy Tsai <billy_tsai@aspee=
dtech.com> wrote:
> > >
> > > > Performing a dummy read ensures that the register write operation i=
s fully
> > > > completed, mitigating any potential bus delays that could otherwise=
 impact
> > > > the frequency of bitbang usage. E.g., if the JTAG application uses =
GPIO to
> > > > control the JTAG pins (TCK, TMS, TDI, TDO, and TRST), and the appli=
cation
> > > > sets the TCK clock to 1 MHz, the GPIO=E2=80=99s high/low transition=
s will rely on
> > > > a delay function to ensure the clock frequency does not exceed 1 MH=
z.
> > > > However, this can lead to rapid toggling of the GPIO because the wr=
ite
> > > > operation is POSTed and does not wait for a bus acknowledgment.
> > > >
> > > > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > >
> > > If this applies cleanly on mainline I think it should go into fixes a=
s-is.
> > >
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > >
> > > Yours,
> > > Linus Walleij
>
> > I agree but it doesn't. :(
>
> > Billy: please send it separately and - while at it - use a C-style comm=
ent.
>
> > Bart
>
> Hi Linus Walleij and Bart,
>
> Sorry, I don=E2=80=99t quite understand the meaning of =E2=80=9Csend it s=
eparately.=E2=80=9D
> Does this mean I need to send this patch individually after the GPIO patc=
h series has been accepted?
>

This is a fix, meaning: it should go upstream now and get backported
to stable branches. The other patches from this series will go in the
next merge window in two months or so. So send this as the first patch
in the series with an appropriate Fixes: tag or even send it entirely
independently from the rest.

Bart
