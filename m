Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E55F78353
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 04:24:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45xk5f745kzDqDW
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 12:24:06 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=osk@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="UpvBC6PB"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45xk2t3jn3zDqRx
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 12:21:42 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id p15so57868017eds.8
 for <linux-aspeed@lists.ozlabs.org>; Sun, 28 Jul 2019 19:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QdAp3TBVfkBf9+OS69PWdAwQosKb0BkD9CBz+fDZU1w=;
 b=UpvBC6PBf/auPm1oEN4ybBB9h6PnngL/s+wWoXs9XpApabbII9MbTgrDKl8cKqdZM5
 DW3UP626oFE6zGTKViThOX0a5RsDUDcv1cFizbb8nNcAGTIA9ee1N/842jrWdLptXL4v
 v7nusmWV/ef520Xik04zqWvU6SybfGcbqUJl5nmzORaQoD7VsHplhc8OXOwrP6qFVsUf
 5LLfJ9zoBYt0Jzicev2wksuTmV78RXxSCczwPaoQ2JFHFfQVGuspLURAjnOXfe0UXXSY
 GShKthDj8AUq6tSTmJ1kMu5g6kpxAqrUi0VQlTLvAQ4Cbrf2/nhNRHmdVD+CUBDe2fLo
 VS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QdAp3TBVfkBf9+OS69PWdAwQosKb0BkD9CBz+fDZU1w=;
 b=GfBEIAxN25Kr7lHJBDGaNnFhnZU3rvV11+iW75E26ht3p105Ib3syhbs50qC9FQco5
 LtTya4D1pZoOr6BUt/h0CFgxVZ4F8w+pHA/4viNxu7Fm7ERtaO2S9kWakJwFmwgquMCb
 YJnaf7zkFpqytDFjSAxIUn7OViN7PHywKEhgk1O91AvbqW265vX6r0xPV0YmK05JR84x
 9xhyg3L3nVGvRiy5QufzmTxzKakkkYzdN1UdeK/TaEKL7JhGqiKpH4PpyqNxiGIflTlM
 LVDuxKenqzOvrMzI/xqngsUN1sszsjoBMe80Z7GFzXcJ0XzutDCym/hArfuo55DvEs+t
 Df5A==
X-Gm-Message-State: APjAAAXvAw49vrajG2GiYUt+6cyrfIH/VcYJl7PWzh/fw0FLfTIr4l0J
 lbZyG4NMelcg60wzumth7cbR7yxgzmWr6P2GqzdWpw==
X-Google-Smtp-Source: APXvYqzt7b/NvuyjUOnQnmm+uyvrgATA45uggpNurXylfW39LgUpzN2dU/FurR1go/tS3o5XESCbdTONxLLX9+eEHRA=
X-Received: by 2002:a17:906:3f91:: with SMTP id
 b17mr55844660ejj.74.1564366898906; 
 Sun, 28 Jul 2019 19:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190727134242.49847-1-osk@google.com>
 <9fb8c99449cebd68fb5975890dedaa06ce7808ae.camel@kernel.crashing.org>
 <CABoTLcRPXffZuKy-DTFUVKJQRydSzMDynYRgBbZ_470iVN1KnA@mail.gmail.com>
 <CABoTLcTSFvQruPRnoRPgiWjOXNDOCSnAXVesG7f1WAuLLLVSSg@mail.gmail.com>
 <6b31627a8c5a2616c83783550517961b7ed8f3cb.camel@ozlabs.org>
 <CABoTLcQF4_He15F5oO0Pxjdm6f7pLCxBF77cz7wR=jjWaednYQ@mail.gmail.com>
 <9855284dfa4c4d4a52441553691c7b4b08a9cc34.camel@ozlabs.org>
In-Reply-To: <9855284dfa4c4d4a52441553691c7b4b08a9cc34.camel@ozlabs.org>
From: Oskar Senft <osk@google.com>
Date: Sun, 28 Jul 2019 22:21:21 -0400
Message-ID: <CABoTLcS2Pepyfc8A-gzm+Nh2T5yCCmexCC94K8Pm=4mtM4JHBA@mail.gmail.com>
Subject: Re: [PATCH] drivers/tty/serial/8250: Make Aspeed VUART SIRQ polarity
 configurable
To: Jeremy Kerr <jk@ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000004f49a3058ec88dda"
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

--0000000000004f49a3058ec88dda
Content-Type: text/plain; charset="UTF-8"

Hi Jeremy

Somewhat offtopic, but are you sure you want to enable the SuperIO
> device?
>
No :-D I'm aware of CVE-2019-6260. I just listed it as a potential source
of SIRQs.


> >  The VUART is covered by this code and we don't have a PUART driver
> > yet.
> >
> > It might make sense to have this as a global setting which each driver
> > could read. But wouldn't this be an exercise for the future where we
> > actually have a second device? I don't think the Aspeed currently has
> > any other devices that could generate a SIRQ (except for the PUART for
> > which there's no driver).
>
> We have a bunch of SIRQ sources that we use (on OpenPOWER platforms) -
> the BT interface, the KCS interface, the UARTs, and the mbox hardware.
> It's not just the VUART/PUART :)
>
Interesting. From what Aspeed explained, the SIRQ polarity for UARTs is
inverted to that for other devices. I haven't looked into how other devices
work, to be honest. Do we set the polarity there explicitly?


> > Having said that, ideally I'd like the SIRQ polarity to be auto-
> > configured from the LPC/eSPI HW pin strap anyway. I have the code for
> > that almost done. Maybe we shouldn't even have the sysfs interface for
> > it and I should strip that out?
>
> Yeah, I think I agree with that. The only downside is that the
> individual drivers will now need to poke at the SCU to query the
> LPC/eSPI configuration. If you can find a nice way to do that, then that
> sounds like the best approach. Can you query it through the parent bus
> perhaps?
>
I'm experimenting with this:
syscon_regmap_lookup_by_compatible("aspeed,ast2500-scu");

I'll need to think on how to make this work on both ast2400 and ast2500,
though. I actually need to have a look at the ast2400 data sheet wrt. VUART
registers, too!

The structure is this:
apb {
  syscon {
    ...
  }
  vuart {
    ...
  }
}

So the vuart is a sibling of syscon, which holds the registers. I guess
I'll have to go with "by_compatible"?

Oskar.

--0000000000004f49a3058ec88dda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div>Hi Jeremy<div><br><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Somewhat offtop=
ic, but are you sure you want to enable the SuperIO<br>
device?<br></blockquote><div>No :-D I&#39;m aware of=C2=A0CVE-2019-6260. I =
just listed it as a potential source of SIRQs.</div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">&gt;=C2=A0 The VUART is covered=
 by this code and we don&#39;t have a PUART driver<br>
&gt; yet.<br>
&gt; <br>
&gt; It might make sense to have this as a global setting which each driver=
<br>
&gt; could read. But wouldn&#39;t this be an exercise for the future where =
we<br>
&gt; actually have a second device? I don&#39;t think the Aspeed currently =
has<br>
&gt; any other devices that could generate a SIRQ (except for the PUART for=
<br>
&gt; which there&#39;s no driver).<br>
<br>
We have a bunch of SIRQ sources that we use (on OpenPOWER platforms) -<br>
the BT interface, the KCS interface, the UARTs, and the mbox hardware.<br>
It&#39;s not just the VUART/PUART :)<br></blockquote><div>Interesting. From=
 what Aspeed explained, the SIRQ polarity for UARTs is inverted to that for=
 other devices. I haven&#39;t looked into how other devices work, to be hon=
est. Do we set the polarity there explicitly?</div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">&gt; Having said that, ideally I=
&#39;d like the SIRQ polarity to be auto-<br>
&gt; configured from the LPC/eSPI HW pin strap anyway. I have the code for<=
br>
&gt; that almost done. Maybe we shouldn&#39;t even have the sysfs interface=
 for<br>
&gt; it and I should strip that out?<br>
<br>
Yeah, I think I agree with that. The only downside is that the <br>
individual drivers will now need to poke at the SCU to query the<br>
LPC/eSPI configuration. If you can find a nice way to do that, then that<br=
>
sounds like the best approach. Can you query it through the parent bus<br>
perhaps?<br></blockquote><div>I&#39;m experimenting with this:</div><div>sy=
scon_regmap_lookup_by_compatible(&quot;aspeed,ast2500-scu&quot;);<br></div>=
<div><br></div><div>I&#39;ll need to think on how to make this work on both=
 ast2400 and ast2500, though. I actually need to have a look at the ast2400=
 data sheet wrt. VUART registers, too!</div><div><br></div><div>The structu=
re is this:</div><div>apb {</div><div>=C2=A0 syscon {</div><div>=C2=A0 =C2=
=A0 ...</div><div>=C2=A0 }</div><div>=C2=A0 vuart {</div><div>=C2=A0 =C2=A0=
 ...</div><div>=C2=A0 }</div><div>}</div><div><br></div><div>So the vuart i=
s a sibling of syscon, which holds the registers. I guess I&#39;ll have to =
go with &quot;by_compatible&quot;?</div><div><br></div><div>Oskar.</div></d=
iv></div></div>

--0000000000004f49a3058ec88dda--
