Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9771A6138
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Apr 2020 02:24:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 490qBM4tGzzDqVQ
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Apr 2020 10:24:43 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12a;
 helo=mail-lf1-x12a.google.com; envelope-from=osk@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=AUZbfq6U; dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 490qBD1W22zDqBZ
 for <linux-aspeed@lists.ozlabs.org>; Mon, 13 Apr 2020 10:24:33 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id w145so5375877lff.3
 for <linux-aspeed@lists.ozlabs.org>; Sun, 12 Apr 2020 17:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wbkgMgWArtjAOUF79khW3xSY3Vwoq0ZUylGe6SHZTpA=;
 b=AUZbfq6UECXMwnsLdkqOOWq/07fXkoemKfEFCdyhvr9QOakK8SQL9W2u+SE2bnYmaa
 EGLDQeQEkpy1fssumJtSj0xmqDNVSLNWY8zGfHbJ07hwm8F4qpmHDbKduz8lpb6CggfL
 xSVTJrN21TIXz0pXhf0gWfJMZ4turRovRe3z6vnhg0qrk2ijgqb6J/1s7b7JaMQc/3TB
 bksnUyoqcN6fF9uf1Ne23rPFFzRduYKttXkOj94yn6xbEJL50heNVN8sB9Oc3hvpOzfX
 mMSsTXMknYoaoAYk5vYFqPdcaQ2XDtXyxppQX7h6UOtwFOquYL5PCnJCsUF5WbVeG7xp
 V0RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wbkgMgWArtjAOUF79khW3xSY3Vwoq0ZUylGe6SHZTpA=;
 b=MWz9mbdE9QIy+FrFa9dPFuXMr8aCbVL+yzxer1biIB0WxqBrDP8v4aNl4uAf4k6bzR
 C8g8y4L3Rf6DPx5KL4dJasCR7Z6FB4/KkpGAY7Kdfso6JXcuCsJ3hyePOp2tFQ6MPGp0
 sltCwMeK3BTyUOLDVtVeS0X0MIXQg95TvNZs3ZSBCT1veRzfGsKOyq29q0DSz8Yppa1F
 slMr49s5VVGPQlD6yFyDqBKQPmpZMF+wFj5FWGbzgePgaIfRwhITdYiYqXRk1GuVNopz
 DBFnkL/Qd14fz1fhU1bIufVTey6YSc/PkAgxYtO017EYc5iFh//E6RJUks2tEt2epWat
 MBFw==
X-Gm-Message-State: AGi0PuZIDuYnsYpS6sq98V18nNNL4TfLA5rspd4JvQIJNPrNbpL1O9DO
 YFtR/Y+KPQeK5XqrmvKsRxoezitNoOFpjhEAvrm5aQ==
X-Google-Smtp-Source: APiQypIDExKjnjXvoF4u+DWcb2Di9385tMW4Gey8mdThlLoM9TunfptSbC3KFcxCkQMaOmVunc6geBYpYRqBAUcc3v0=
X-Received: by 2002:ac2:4c9a:: with SMTP id d26mr8838237lfl.112.1586737468095; 
 Sun, 12 Apr 2020 17:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <CABoTLcTN4PnifNTeLp71cnT5Ej_+zVB7yfAPDnPXkGHA0OiUKA@mail.gmail.com>
In-Reply-To: <CABoTLcTN4PnifNTeLp71cnT5Ej_+zVB7yfAPDnPXkGHA0OiUKA@mail.gmail.com>
From: Oskar Senft <osk@google.com>
Date: Sun, 12 Apr 2020 20:24:11 -0400
Message-ID: <CABoTLcQE8r=yu6-doLoGmFgwFcJas5Y9gV-rar+2WHz_DjBuZw@mail.gmail.com>
Subject: Re: AST2600 clock gates
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Content-Type: multipart/alternative; boundary="000000000000239a1505a3211bff"
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--000000000000239a1505a3211bff
Content-Type: text/plain; charset="UTF-8"

OMG, I'm sorry. Ignore. I got confused between ASPEED_CLK_* being random
identifiers and ASPEED_RESET_* actually being bits in the registers. Sorry.

Oskar.

On Sun, Apr 12, 2020 at 7:22 PM Oskar Senft <osk@google.com> wrote:

> Hey Joel and Andrew
>
> I'm working on the AST2600 EVB trying to get some eSPI functionality to
> work using
> https://github.com/AspeedTech-BMC/linux/blob/aspeed-dev-v5.1/drivers/soc/aspeed/aspeed-espi.c.
> The driver is missing support for clock enablement so I dug into how this
> could be added.
>
> I noticed that you guys worked
> on include/dt-bindings/clock/ast2600-clock.h but from what I can tell the
> ASPEED_CLK_GATE_* definitions have not yet been updated from AST2500 to
> AST2600.
>
> Am I looking at the latest version of the file? I'm happy to update the
> clock gate bits, but I don't want to duplicate work that you have in the
> pipeline.
>
> Thanks
> Oskar.
>

--000000000000239a1505a3211bff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OMG, I&#39;m sorry. Ignore. I got confused between=C2=A0AS=
PEED_CLK_* being random identifiers and=C2=A0ASPEED_RESET_* actually being =
bits in the registers. Sorry.<div><br></div><div>Oskar.</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 12=
, 2020 at 7:22 PM Oskar Senft &lt;<a href=3D"mailto:osk@google.com">osk@goo=
gle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div dir=3D"ltr">Hey Joel and Andrew<div><br></div><div>I&#39;m work=
ing on the AST2600 EVB trying to get some eSPI functionality to work using=
=C2=A0<a href=3D"https://github.com/AspeedTech-BMC/linux/blob/aspeed-dev-v5=
.1/drivers/soc/aspeed/aspeed-espi.c" target=3D"_blank">https://github.com/A=
speedTech-BMC/linux/blob/aspeed-dev-v5.1/drivers/soc/aspeed/aspeed-espi.c</=
a>. The driver is missing support for clock enablement so I dug into how th=
is could be added.</div><div><br></div><div>I noticed that you guys worked =
on=C2=A0include/dt-bindings/clock/ast2600-clock.h but from what I can tell =
the ASPEED_CLK_GATE_* definitions have not yet been updated from AST2500 to=
 AST2600.</div><div><br></div><div>Am I looking at the latest version of th=
e file? I&#39;m happy to update the clock gate bits, but I don&#39;t want t=
o duplicate work that you have in the pipeline.</div><div><br></div><div>Th=
anks</div><div>Oskar.</div></div>
</blockquote></div>

--000000000000239a1505a3211bff--
