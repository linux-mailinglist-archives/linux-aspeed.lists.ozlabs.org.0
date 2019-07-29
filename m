Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF3478354
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 04:24:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xk5k1VxZzDq9Z
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 12:24:10 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="AYrtZRBg"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xk4y4Br1zDqSg
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 12:23:30 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id p15so57870222eds.8
 for <linux-aspeed@lists.ozlabs.org>; Sun, 28 Jul 2019 19:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TKvUejZziqBMpfJTRbRut0qnVbaefH4OHPLzQHjpWl4=;
 b=AYrtZRBgsoZchcM91Ax19P+Hl7nYaEd3e1Gc6RZqfTAC/Ya9rz/UaYPe4fShHbU9gh
 pu1FkvN9wrqYpm2AK3Ok2Lj4I8GCfGHOp89jmaJxCKqZWa11iFqZBFwREwLGXBT/WE/U
 ElmDVQBtQ+z7ZA4o5DWJDpR3jg82bebINzv7Q3Z3f333pra9T9WEGl2hIKg6VB9V3J+s
 7zzeBPZfhNV6/Zep28e6LdqBMKDU7e0CaXIDXME5PnjHA01zT5Sg0wDkjZz+NWrEH0u2
 39OYu5laGp0NlFaOcDF/ncBj05E+7Q9MuB38zC0nb0oiaVeOpiEyoZBb7WIXhRy41Pba
 WaZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TKvUejZziqBMpfJTRbRut0qnVbaefH4OHPLzQHjpWl4=;
 b=VLLbrgvnLvHTzJwDfRDTL4OudU3t/WQosyAnlVZ55SKvbCFGgRpZo2k8609JOXdqeR
 jUxZ5ZmCDnat6YEDfeJh/T+QckPijpI8d3r9YNi/VlLLUOtrc3G171jbDfHVNPFK6NBQ
 J03ii8A8972Z5Cl5aV8lfKN9lI94OC6/n9/V55dZVAPzcqqx7WZ1udsGE0SFDkQON3iJ
 ZvqnouVT8xdBi5/E5/Pz059p7B1FOuY6rFuCpV7/858sYdJ3+YNGkv7EL4cS3xxHPZZ6
 qaSteRoc1PPEaxqGF1dChqnLDpbTSRUYs5zTjSixj8kuH9q/c5LeUfRLAH3vCyR+L/BV
 j38A==
X-Gm-Message-State: APjAAAULhCVSo23AYUj4yXi6p9aT1gIxTl5hpO/tbEjlJy/F2c2c8E95
 SHqwGpQ19BcV7LCXnoM4SB329p4pU8xZ+Endi6ijCQ==
X-Google-Smtp-Source: APXvYqyA8MCLbxNug6BdM+G/T77b24W06huZ8QIi23ljvjgWCLu+l+F3PkdcOkOmSG6dtwk3gqH+dazGWtHglElyEdA=
X-Received: by 2002:a50:ba81:: with SMTP id x1mr92464807ede.257.1564367007091; 
 Sun, 28 Jul 2019 19:23:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190727134242.49847-1-osk@google.com>
 <9fb8c99449cebd68fb5975890dedaa06ce7808ae.camel@kernel.crashing.org>
 <CABoTLcRPXffZuKy-DTFUVKJQRydSzMDynYRgBbZ_470iVN1KnA@mail.gmail.com>
 <CABoTLcTSFvQruPRnoRPgiWjOXNDOCSnAXVesG7f1WAuLLLVSSg@mail.gmail.com>
 <6b31627a8c5a2616c83783550517961b7ed8f3cb.camel@ozlabs.org>
 <cd7e4eacb7c6572e58ed5fdc2286082367520e9e.camel@kernel.crashing.org>
In-Reply-To: <cd7e4eacb7c6572e58ed5fdc2286082367520e9e.camel@kernel.crashing.org>
From: Oskar Senft <osk@google.com>
Date: Sun, 28 Jul 2019 22:23:11 -0400
Message-ID: <CABoTLcRWKaNgzLa-26_MVg_tee+qyPhOG2bL4bqTh5DFXFAFbw@mail.gmail.com>
Subject: Re: [PATCH] drivers/tty/serial/8250: Make Aspeed VUART SIRQ polarity
 configurable
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jeremy Kerr <jk@ozlabs.org>
Content-Type: multipart/alternative; boundary="000000000000c1e451058ec89378"
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
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>, linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--000000000000c1e451058ec89378
Content-Type: text/plain; charset="UTF-8"

Ok, so it sounds that a default value derived from HW strap for LPC/eSPI
(see discussion on how to access the registers correctly) + sysfs seems to
be ok?

Oskar.

On Sun, Jul 28, 2019 at 10:20 PM Benjamin Herrenschmidt <
benh@kernel.crashing.org> wrote:

> On Mon, 2019-07-29 at 08:51 +0800, Jeremy Kerr wrote:
> > Hi Oskar,
> >
> > > For LPC, the polarity should be set to 1, for eSPI the default of 0 is
> > > correct.
> >
> > Would there ever be a case where different SIRQs need different
> > polarities? If not, we may want this to be global, rather than for each
> > device (the VUART being one...)
>
> Leave it per device. The way to configure this is completely device
> dependent. In fact for most devices it can only be done by the host via
> SIO.
>
> Cheers,
> Ben.
>
>
>

--000000000000c1e451058ec89378
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ok, so it sounds that a default value derived from HW stra=
p for LPC/eSPI (see discussion on how to access the registers correctly)=C2=
=A0+ sysfs seems to be ok?<div><br></div><div>Oskar.</div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jul 28, 2=
019 at 10:20 PM Benjamin Herrenschmidt &lt;<a href=3D"mailto:benh@kernel.cr=
ashing.org">benh@kernel.crashing.org</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">On Mon, 2019-07-29 at 08:51 +0800, Jere=
my Kerr wrote:<br>
&gt; Hi Oskar,<br>
&gt; <br>
&gt; &gt; For LPC, the polarity should be set to 1, for eSPI the default of=
 0 is<br>
&gt; &gt; correct.<br>
&gt; <br>
&gt; Would there ever be a case where different SIRQs need different<br>
&gt; polarities? If not, we may want this to be global, rather than for eac=
h<br>
&gt; device (the VUART being one...)<br>
<br>
Leave it per device. The way to configure this is completely device<br>
dependent. In fact for most devices it can only be done by the host via<br>
SIO.<br>
<br>
Cheers,<br>
Ben.<br>
<br>
<br>
</blockquote></div>

--000000000000c1e451058ec89378--
