Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B29A678983
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 22:26:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P137n1v7Lz3bZh
	for <lists+linux-aspeed@lfdr.de>; Tue, 24 Jan 2023 08:26:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TbA42UvO;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=vijaykhemkalinux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TbA42UvO;
	dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P137g2Klqz3bNs
	for <linux-aspeed@lists.ozlabs.org>; Tue, 24 Jan 2023 08:26:22 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id h12so8091084wrv.10
        for <linux-aspeed@lists.ozlabs.org>; Mon, 23 Jan 2023 13:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c8ptyLLDfstj8Wx5r2MJ7ZUoi6cS2rQX3PWte82hH64=;
        b=TbA42UvOUMVgu/nslY16+KHpHGPnqOpJQB5ZgK9mWzNrNR4Q38btb6MwpDvCoOjL9D
         sX9I35SxVtVV0AuC5OcGHJ/haSbIUOHMIxR1LUseDCQeTtraXLcrp01iZw8GGdUzlSDt
         DZ0VRcf9vRU5pUeaeLw2E7jv9p9MoERJfztWLqTKssPuNNbZcORZmM8Tfa+nBpN2/PlR
         bmuAPYfcJFTAT7JFBUO0knWIViz5EXGYRk6yL3vhOduK8IWTp9w8R/ucHxtMQlvgRvoK
         tXn6gJXYBiAxsu66hSIDeOd8EtyJGfKjLfitHr7Szp7eL/7L91P5jYrM3el0vU1DztPR
         uBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c8ptyLLDfstj8Wx5r2MJ7ZUoi6cS2rQX3PWte82hH64=;
        b=eIhZx82g1xCDXCU07b5no5FhC39lfzQBi2Scjx0abxMMJqLu6Y2pou5Y8RaxNnKkBm
         O2aHj8fK7KLNE6MBye4QHMuYKWR4bO8gDp6H/Os3WdwTxYdUbaM6rrSGkWZvz+1rnFib
         AT13OUvutEFWLm0P5F9wKGuAlbyQ0R9wnaRhQRqum4r2SSst6wF0a50naMje/uPwVEqy
         uRkBvywKwbsX6V5wER7Qcp505F/wNpRYP0JzV4jm9TQ5k1YmDxX5pcI5hK1ZCyvHGXEg
         FgOFs4YLt38KiVk+EOTkrzyC+LDuEG5LJyqFV81sJQs7rnTrRk4uHcmMWa+zQ40uz9N8
         UNew==
X-Gm-Message-State: AFqh2kp15dz0JaoonTkauJD8ypp4WSGZlR90JIWdzi4EWgn7arcPQkVB
	sr7x/NAntKVkh0wqdXZUdZbZd+k5v/cObuAHY29LCF9o
X-Google-Smtp-Source: AMrXdXtGP1FCI1Uq1dwoqpw6Pt3Y/00oN3udJotr9gS0rTeYr5w5aVZzn44a/nrRm7NP7LVJ5NgOB1BN8494j0Yw/nA=
X-Received: by 2002:a5d:4ed1:0:b0:2be:57a3:1fcf with SMTP id
 s17-20020a5d4ed1000000b002be57a31fcfmr756067wrv.685.1674509175857; Mon, 23
 Jan 2023 13:26:15 -0800 (PST)
MIME-Version: 1.0
References: <CAJTGxZH2VAn8-=LKuA76bGkrXtm1y99LW_-yDqh52UX7Kd4tZw@mail.gmail.com>
 <79c1441e-20dd-4c2a-8dfc-a8fdaded20b7@app.fastmail.com>
In-Reply-To: <79c1441e-20dd-4c2a-8dfc-a8fdaded20b7@app.fastmail.com>
From: Vijay Khemka <vijaykhemkalinux@gmail.com>
Date: Mon, 23 Jan 2023 13:26:04 -0800
Message-ID: <CAJTGxZErSFzAieHntqQTiFYJX3n4OiPmgoBdCczdHw=9HWP6Ww@mail.gmail.com>
Subject: Re: KCS over eSPI
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="00000000000099a85805f2f50c23"
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
Cc: linux-aspeed@lists.ozlabs.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--00000000000099a85805f2f50c23
Content-Type: text/plain; charset="UTF-8"

Thanks Andrew,
I guess Intel has done this because I saw the espi slave driver patch by
them, I am assuming they must have made changes to KCS to make use of eSPI
instead of LPC.

Thanks again for the info, I will keep looking for a solution.

Regards
-Vijay

On Sun, Jan 22, 2023 at 2:17 PM Andrew Jeffery <andrew@aj.id.au> wrote:

>
>
> On Sat, 21 Jan 2023, at 11:40, Vijay Khemka wrote:
> > Team,
> > I am planning to use eSPI interface instead of LPC on aspeed. I see some
> > patches by intel for espi slave driver but I need to integrate this with
> > KCS. Our current upstream version of KCS only supports LPC. Please point
> me
> > to any patches available to support KCS over eSPI.
>
> Aspeed were doing some work for eSPI support a while back, but beyond
> that I'm not aware of any patches to bring to your attention. Also, IBM
> isn't planning on exploiting eSPI from what I know, so I don't think
> we'll have much motivation to get the driver side of things worked out
> ourselves.
>
> Andrew
>

--00000000000099a85805f2f50c23
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Andrew,<div>I guess Intel has done this because I s=
aw the espi slave driver patch by them, I am assuming they must have made c=
hanges to KCS to make use of eSPI instead of LPC.=C2=A0</div><div><br></div=
><div>Thanks again for the info, I will keep looking for a solution.</div><=
div><br></div><div>Regards</div><div>-Vijay</div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 22, 2023 at 2:=
17 PM Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au">andrew@aj.id.au=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<br>
<br>
On Sat, 21 Jan 2023, at 11:40, Vijay Khemka wrote:<br>
&gt; Team,<br>
&gt; I am planning to use eSPI interface instead of LPC on aspeed. I see so=
me<br>
&gt; patches by intel for espi slave driver but I need to integrate this wi=
th<br>
&gt; KCS. Our current upstream version of KCS only supports LPC. Please poi=
nt me<br>
&gt; to any patches available to support KCS over eSPI.<br>
<br>
Aspeed were doing some work for eSPI support a while back, but beyond <br>
that I&#39;m not aware of any patches to bring to your attention. Also, IBM=
 <br>
isn&#39;t planning on exploiting eSPI from what I know, so I don&#39;t thin=
k <br>
we&#39;ll have much motivation to get the driver side of things worked out =
<br>
ourselves.<br>
<br>
Andrew<br>
</blockquote></div>

--00000000000099a85805f2f50c23--
