Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFFC4643DB
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Dec 2021 01:14:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3fhV4fYJz3bY0
	for <lists+linux-aspeed@lfdr.de>; Wed,  1 Dec 2021 11:14:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=EklqrKyi;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2c;
 helo=mail-yb1-xb2c.google.com; envelope-from=aaelhaj@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=EklqrKyi; dkim-atps=neutral
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3VNb6Trhz2yg4
 for <linux-aspeed@lists.ozlabs.org>; Wed,  1 Dec 2021 04:59:43 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 131so55138883ybc.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Nov 2021 09:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HsK61wUqoF3X3DSLeAJwJAq81Zz1B9V97fFegXJcJUc=;
 b=EklqrKyiWXFJlaHMD9PiolhQtMR7TKpVzV7H3mhswL2AAeKytfy15VhufhEcRs0jcd
 RELS64VeD2G598E+phxnvSMfUiqUStbr5yUjX1vssM0AgK6BZ94iMUWncT6Fzk9t127W
 U3tq8/VX92aVsRYKwG1AEf7UTsGdnqGTSpruckE8CqtopxwLOIVrWbsf/4Ywpus2nYDt
 oTdGV9c3eMIlK6cB/2ley16yWzABpizHJt2mHdsFG8TIRJXFCGY3iToPn4/2Ajxb6ycr
 RAWTbYrtLfV9AzGi28l3imuu4FPHbGOXkYaWdhuawJvDne+eGKMxnsjSmBxJoc6MlOW0
 HhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HsK61wUqoF3X3DSLeAJwJAq81Zz1B9V97fFegXJcJUc=;
 b=5/YSnyk5fgNJA0Q2HP2u/VbmMfIX7AOmodqKVXSeuOcrVPBMPnA7pyDmscrPPa9HHm
 DKmlTZBLL3FujOK14xfAlllgV+0dU0jrPltVuhLJVOizyDQI9jWsKHxORNgutLTPyXaH
 YPYEMJQnL1ykKwxkN0S1tGKROrrKTmdh0wTLskozJGjYRNlyZ3+C6642w2pgMKadrXNm
 qyO8gG/N1kfHFg1pcRZ98IOJGHALANksMBOGZKVP54V6UC0SppmctbZGmFz2kDfH3hvn
 SjT+RGD9thTfZjlUqzCrZmLGiD0UPBQVMzYgxPGzv9vvOSdJv/ZxNDMFehamV5oZDvmS
 cMPw==
X-Gm-Message-State: AOAM5321qoPJhEhkZWZIck5gYKMhzALy417X+BUpkn+gFdv0gwwPD2Rv
 LJkAGLLF1/vy0x0ihth/ZhgyGhfBjOFNhdoL0639yw==
X-Google-Smtp-Source: ABdhPJz4TNJErTG1gvpQnrx/9D/h6XitkZC7dt2Dc8zkxSKLEvVuOHH0AaQ1n6MTYl+CQymL81ciYOzvx2HaZecXIVM=
X-Received: by 2002:a25:dc42:: with SMTP id y63mr656649ybe.402.1638295179861; 
 Tue, 30 Nov 2021 09:59:39 -0800 (PST)
MIME-Version: 1.0
References: <20211130175740.2216591-1-aaelhaj@google.com>
In-Reply-To: <20211130175740.2216591-1-aaelhaj@google.com>
From: Ali El-Haj-Mahmoud <aaelhaj@google.com>
Date: Tue, 30 Nov 2021 12:59:13 -0500
Message-ID: <CAFPZpNb+7JNu+B9gLnv_Q_k_vFMt5odqRVZ1tQVgbM7QRxJpPQ@mail.gmail.com>
Subject: Re: [PATCH] S8036 DTS changes:
To: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Content-Type: multipart/alternative; boundary="0000000000003c532905d205528c"
X-Mailman-Approved-At: Wed, 01 Dec 2021 11:13:59 +1100
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
Cc: Rob Herring <robh+dt@kernel.org>, Oskar Sneft <osk@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--0000000000003c532905d205528c
Content-Type: text/plain; charset="UTF-8"

Oops. Please ignore. Sent from incorrect workspace.

On Tue, Nov 30, 2021 at 12:58 PM Ali El-Haj-Mahmoud <aaelhaj@google.com>
wrote:

> - Allow VUART and SuperIO to coexist.
> - Minor formatting.
> ---
>  .../linux-aspeed/aspeed-bmc-tyan-s8036.dts    | 23 +++++++++++++++----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git
> a/meta-tyan/meta-s8036/recipes-kernel/linux/linux-aspeed/aspeed-bmc-tyan-s8036.dts
> b/meta-tyan/meta-s8036/recipes-kernel/linux/linux-aspeed/aspeed-bmc-tyan-s8036.dts
> index 30b68ce89..7f650f6c8 100644
> ---
> a/meta-tyan/meta-s8036/recipes-kernel/linux/linux-aspeed/aspeed-bmc-tyan-s8036.dts
> +++
> b/meta-tyan/meta-s8036/recipes-kernel/linux/linux-aspeed/aspeed-bmc-tyan-s8036.dts
> @@ -127,10 +127,23 @@
>         status = "okay";
>  };
>
> +&uart_routing {
> +       status = "okay";
> +};
> +
>  &vuart {
>         status = "okay";
> -       aspeed,lpc-io-reg = <0x3f8>;
> -       aspeed,lpc-interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
> +
> +       /* We enable the VUART here, but leave it in a state that does
> +        * not interfere with the SuperIO. The goal is to have both the
> +        * VUART and the SuperIO available and decide at runtime whether
> +        * the VUART should actually be used. For that reason, configure
> +        * an "invalid" IO address and an IRQ that is not used by the
> +        * BMC.
> +        */
> +
> +       aspeed,lpc-io-reg = <0xffff>;
> +       aspeed,lpc-interrupts = <15 IRQ_TYPE_LEVEL_HIGH>;
>  };
>
>  &lpc_ctrl {
> @@ -340,7 +353,7 @@
>
>  &kcs1 {
>         status = "okay";
> -   aspeed,lpc-io-reg = <0xca8>;
> +       aspeed,lpc-io-reg = <0xca8>;
>  };
>
>  &kcs3 {
> @@ -385,7 +398,7 @@
>         /*A6*/          "",
>         /*A7*/          "",
>         /*B0-B7*/       "","","","","","","","",
> -   /*C0-C7*/   "","","","","","","","",
> +       /*C0-C7*/       "","","","","","","","",
>         /*D0*/          "",
>         /*D1*/          "",
>         /*D2*/          "power-chassis-good", /* in: PWR_GOOD_LED -- Check
> if this is Z3?*/
> @@ -447,6 +460,6 @@
>         /*AA5*/         "",
>         /*AA6*/         "",
>         /*AA7*/         "BMC_ASSERT_BMC_READY",
> -   /*AB0*/     "BMC_SPD_SEL",
> +       /*AB0*/     "BMC_SPD_SEL",
>         /*AB1-AB7*/     "","","","","","","";
>  };
> --
> 2.34.0.rc2.393.gf8c9666880-goog
>
>

--0000000000003c532905d205528c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif;font-size:small">Oops. Please ignore. Sent from incorrec=
t workspace.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Tue, Nov 30, 2021 at 12:58 PM Ali El-Haj-Mahmoud &lt;<=
a href=3D"mailto:aaelhaj@google.com">aaelhaj@google.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">- Allow VUART and Su=
perIO to coexist.<br>
- Minor formatting.<br>
---<br>
=C2=A0.../linux-aspeed/aspeed-bmc-tyan-s8036.dts=C2=A0 =C2=A0 | 23 ++++++++=
+++++++----<br>
=C2=A01 file changed, 18 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta-tyan/meta-s8036/recipes-kernel/linux/linux-aspeed/aspeed-=
bmc-tyan-s8036.dts b/meta-tyan/meta-s8036/recipes-kernel/linux/linux-aspeed=
/aspeed-bmc-tyan-s8036.dts<br>
index 30b68ce89..7f650f6c8 100644<br>
--- a/meta-tyan/meta-s8036/recipes-kernel/linux/linux-aspeed/aspeed-bmc-tya=
n-s8036.dts<br>
+++ b/meta-tyan/meta-s8036/recipes-kernel/linux/linux-aspeed/aspeed-bmc-tya=
n-s8036.dts<br>
@@ -127,10 +127,23 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
=C2=A0};<br>
<br>
+&amp;uart_routing {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D &quot;okay&quot;;<br>
+};<br>
+<br>
=C2=A0&amp;vuart {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed,lpc-io-reg =3D &lt;0x3f8&gt;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed,lpc-interrupts =3D &lt;4 IRQ_TYPE_LEVEL_=
HIGH&gt;;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* We enable the VUART here, but leave it in a =
state that does<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * not interfere with the SuperIO. The goal is =
to have both the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * VUART and the SuperIO available and decide a=
t runtime whether<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * the VUART should actually be used. For that =
reason, configure<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * an &quot;invalid&quot; IO address and an IRQ=
 that is not used by the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * BMC.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed,lpc-io-reg =3D &lt;0xffff&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed,lpc-interrupts =3D &lt;15 IRQ_TYPE_LEVEL=
_HIGH&gt;;<br>
=C2=A0};<br>
<br>
=C2=A0&amp;lpc_ctrl {<br>
@@ -340,7 +353,7 @@<br>
<br>
=C2=A0&amp;kcs1 {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D &quot;okay&quot;;<br>
-=C2=A0 =C2=A0aspeed,lpc-io-reg =3D &lt;0xca8&gt;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed,lpc-io-reg =3D &lt;0xca8&gt;;<br>
=C2=A0};<br>
<br>
=C2=A0&amp;kcs3 {<br>
@@ -385,7 +398,7 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*A6*/=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*A7*/=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*B0-B7*/=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot=
;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&q=
uot;,&quot;&quot;,<br>
-=C2=A0 =C2=A0/*C0-C7*/=C2=A0 =C2=A0&quot;&quot;,&quot;&quot;,&quot;&quot;,=
&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*C0-C7*/=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot=
;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&q=
uot;,&quot;&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*D0*/=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*D1*/=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*D2*/=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;=
power-chassis-good&quot;, /* in: PWR_GOOD_LED -- Check if this is Z3?*/<br>
@@ -447,6 +460,6 @@<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*AA5*/=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*AA6*/=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*AA7*/=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
BMC_ASSERT_BMC_READY&quot;,<br>
-=C2=A0 =C2=A0/*AB0*/=C2=A0 =C2=A0 =C2=A0&quot;BMC_SPD_SEL&quot;, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/*AB0*/=C2=A0 =C2=A0 =C2=A0&quot;BMC_SPD_SEL&qu=
ot;, <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*AB1-AB7*/=C2=A0 =C2=A0 =C2=A0&quot;&quot;,&qu=
ot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;,&quot;&quot;;=
<br>
=C2=A0};<br>
-- <br>
2.34.0.rc2.393.gf8c9666880-goog<br>
<br>
</blockquote></div>

--0000000000003c532905d205528c--
