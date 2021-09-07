Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD6740319A
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Sep 2021 01:41:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H41xN5qYxz2yJ9
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Sep 2021 09:41:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=qsDSSEuV;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=qsDSSEuV; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H41xJ1QpLz2xXh
 for <linux-aspeed@lists.ozlabs.org>; Wed,  8 Sep 2021 09:41:06 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id m28so1084097lfj.6
 for <linux-aspeed@lists.ozlabs.org>; Tue, 07 Sep 2021 16:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=orvMsKTnXllXNNcLgdiSuCHx+Dvr/JT1JXTdS9UZGOo=;
 b=qsDSSEuV0iJFmdSWGImuzJbq41C7c4SdK4FJCleAGxfWup4jIhEvQqtGtYqK9QR4/7
 YtIOPEMoq54nmKWbwxdAJnBqeQo6s7X29vw37HPK8/AA5IwVhuvHxVtbKSzPLB3ZeNT4
 T53b+f9uHcuN2iVENphwXiFBHwpj/3jby8aEgYCGv2oOVuUOMru8i6Cj/6AznNyreanO
 Zd+H/0qOLvoy8X/A/NoIsLiSYJSXdwf3UtQdH1B0lp155ZRus5U+naxPHOUeDRBDjF17
 N2abNd+muzf8Mtpago065GHHFZUfg+sUASyRFnxfCxhfw1c7M/7cKHdSzkf6Rt0yyxMH
 6JHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=orvMsKTnXllXNNcLgdiSuCHx+Dvr/JT1JXTdS9UZGOo=;
 b=Vkx/T4DNaCb9awcMQDwbNYEmHBLBnmjDigUQuuDk6Ik+iHEOTOLvE8iZZ4sTDO9PiD
 caCfotrlbMhnfxUEKTMZvCPKVvcwm1PYfktyxBWbmBfKPjhc6K68Nl09YU0Va22Af4Od
 RaoXFiVZ4JgO9yEFklxXO1y/W2/eWXD1PH8Wi/kIpnw+HfbAL78woUa6VOlW6s1udII7
 1FgfdsI23LPVnD7/94C32N34vJMmTQ5gOv5Rf9Wu15DoV5gg2Ss6vuXDgUonl76D9gwV
 G7iU2+yN20vffND2OqFsm80i1csLhhAzhaHIydaLEosIVFWPEOcgyZgOsXlfiQJ5EIOf
 S4KA==
X-Gm-Message-State: AOAM531pWa676mFEfbjas++mtyLtSgO86N2taLKfBMawPG5yRfKFDEu5
 0VaJiyvTfl7kvRiW71T5EjQlXbqy4AyN+5kWNbnttg==
X-Google-Smtp-Source: ABdhPJwqVS/EcGVolSUlcKxEHmr9ztUBUl3LPffgx+QLMwfdV4049eu2Va4DYUIZDCah25IzthDj1tmXE9S9KHDX6ao=
X-Received: by 2002:a05:6512:32c8:: with SMTP id
 f8mr665599lfg.243.1631058057337; 
 Tue, 07 Sep 2021 16:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210907194931.1173750-1-osk@google.com>
 <CACPK8Xd-2FeUh3+yeJ7T87Vz8+A94TqiYO1Am0Tk=5nDLbeVQQ@mail.gmail.com>
In-Reply-To: <CACPK8Xd-2FeUh3+yeJ7T87Vz8+A94TqiYO1Am0Tk=5nDLbeVQQ@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Tue, 7 Sep 2021 19:40:41 -0400
Message-ID: <CABoTLcTHyfj+bOEyDM1HeZzbB=2AqK2vTqFO5UonDSYKpL0+Bw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add TYAN S7106 BMC machine
To: Joel Stanley <joel@jms.id.au>
Content-Type: multipart/alternative; boundary="0000000000001df12705cb704cdc"
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>, Ed Tanous <ed@tanous.net>,
 Jason Hargis <jason.hargis@equuscs.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--0000000000001df12705cb704cdc
Content-Type: text/plain; charset="UTF-8"

Hey Joel

Thank you so much for the super fast review! So many things have changed a
bit since I worked on this DTS originally (years ago) - thanks for pointing
me to the updates! I'll make the changes as recommended.

> +&gpio {
>
> +       status = "okay";
> > +       gpio-line-names =
> > +       /*A0-A7*/       "","","IDLED_N","","","","","",
> > +       /*B0-B7*/       "","","","","","","","",
> > +       /*C0-C7*/       "","","","","ID_BUTTON","POST_COMPLETE","","",
> > +       /*D0-D7*/       "","","PS_PWROK","PLTRST_N","","","","",
> > +       /*E0-E7*/
>  "POWER_BUTTON","POWER_OUT","RESET_BUTTON","RESET_OUT",
> > +
>  "NMI_BUTTON","NMI_OUT","","HEARTBEAT_LED_N",
>
> We have a document that contains names for common BMC GPIOs:
>
>
> https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md
>
> Ideally your device tree would use them, but given this is an old
> platform then I understand if you want to maintain compatibility with
> existing userspace.
>
> This is good to know! This is a "new" platform in the sense that we're
finally upstreaming (even if we have been running it for 2 years on an
older internal build). Also, this is going to be the basis for at least one
additional TYAN board, so I'd like to get it "as right as possible" to
avoid bad copy&paste. I was following the "standard" names from
x86-power-control (https://github.com/openbmc/x86-power-control) so I had
already renamed some of TYAN's original net names. With that, I'd be happy
to rename all of the signals to follow the OpenBMC standard.

Some questions on that, given that there are a few signals that don't have
an obvious equivalent in the GPIO naming doc:

   - Some LEDs and outputs are _N-ed, i.e. active low. Is there a good way
   to indicate that? This is important, e.g. for "ALERT".
   - There are some signals that are inputs but are not buttons, e.g.
   "PLTRST_N". Also, this particular example is active low.
   - There are a bunch of output signals that control muxes,
   e.g. BMC_PE_SMB_EN_1_N. Is there a naming convention for those?

Does it make sense for each OpenBMC signal to also indicate the original
net name from the schematics. I realize that not many people have access to
that, but it would be good for those who do. I'd rather document "too much"
than too little.

Thanks
Oskar.

--0000000000001df12705cb704cdc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hey Joel<div><br></div><div>Thank you so =
much for the super fast review! So many things have changed a bit since I w=
orked on this DTS originally (years ago) - thanks for pointing me to the up=
dates! I&#39;ll make the changes as recommended.</div><div><br></div></div>=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">&gt; +&amp;gpio {<br></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0gpio-line-names =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*A0-A7*/=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
&quot;,&quot;&quot;,&quot;IDLED_N&quot;,&quot;&quot;,&quot;&quot;,&quot;&qu=
ot;,&quot;&quot;,&quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*B0-B7*/=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&qu=
ot;&quot;,&quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*C0-C7*/=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;ID_BUTTON&quot;,&quot;P=
OST_COMPLETE&quot;,&quot;&quot;,&quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*D0-D7*/=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
&quot;,&quot;&quot;,&quot;PS_PWROK&quot;,&quot;PLTRST_N&quot;,&quot;&quot;,=
&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/*E0-E7*/=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
POWER_BUTTON&quot;,&quot;POWER_OUT&quot;,&quot;RESET_BUTTON&quot;,&quot;RES=
ET_OUT&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;NMI_BUTTON&quot;,&quot;NMI_OUT&quot;,&quot;&quot;,&quot;HEARTBEAT_LED_N&qu=
ot;,<br>
<br>
We have a document that contains names for common BMC GPIOs:<br>
<br>
<a href=3D"https://github.com/openbmc/docs/blob/master/designs/device-tree-=
gpio-naming.md" rel=3D"noreferrer" target=3D"_blank">https://github.com/ope=
nbmc/docs/blob/master/designs/device-tree-gpio-naming.md</a><br>
<br>
Ideally your device tree would use them, but given this is an old<br>
platform then I understand if you want to maintain compatibility with<br>
existing userspace.<br><br></blockquote><div>This is good to know! This is =
a &quot;new&quot; platform in the sense that we&#39;re finally upstreaming =
(even if we have been running it for 2 years on an older internal build). A=
lso, this is going to be the basis for at least one additional TYAN board,=
=C2=A0so I&#39;d like to get it &quot;as right as possible&quot; to avoid=
=C2=A0bad copy&amp;paste. I was following the &quot;standard&quot; names fr=
om x86-power-control (<a href=3D"https://github.com/openbmc/x86-power-contr=
ol">https://github.com/openbmc/x86-power-control</a>) so I had already rena=
med some of TYAN&#39;s original net names. With that, I&#39;d be happy to r=
ename all of the signals to follow the OpenBMC standard.</div><div><br></di=
v><div>Some questions on that, given that there are a few signals that don&=
#39;t have an obvious equivalent in the GPIO naming doc:</div><div><ul><li>=
Some LEDs and outputs are _N-ed, i.e. active low. Is there a good way to in=
dicate that? This is important, e.g. for &quot;ALERT&quot;.</li><li>There a=
re some signals that are inputs but are not buttons, e.g. &quot;PLTRST_N&qu=
ot;. Also, this particular example is active low.</li><li>There are a bunch=
 of output signals that control muxes, e.g.=C2=A0BMC_PE_SMB_EN_1_N. Is ther=
e a naming convention for those?</li></ul><div>Does it make sense for each =
OpenBMC signal to also indicate the original net name from the schematics. =
I realize that not many people have access to that, but it would be good fo=
r those who do. I&#39;d rather document &quot;too much&quot; than too littl=
e.</div></div><div><br></div><div>Thanks</div><div>Oskar.</div><div><br></d=
iv></div></div>

--0000000000001df12705cb704cdc--
