Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF02852263
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 07:01:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XvBM1RHMzDqSx
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 15:00:59 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=open.sudheer@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="m2g8QZy3"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XvBC5gxTzDqHm
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 15:00:51 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id x17so16179655wrl.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 24 Jun 2019 22:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b6B/E3hhp3X1MulY7MUv+5AZT31ez/1vwG0GYr6mVi8=;
 b=m2g8QZy3jeFb0bSDHVpAtXIvQ1T9j86MeELTnXPvZs6GACabQp1u3r34IG2eNWdxJ/
 wasHDbj8lzyWOZfwstL276gkBXZ06Ep5FCS9ZGIpJl3T0cNjvdYDdVRc6Qj/UWk5PlRS
 CZhzSTQ7TjNPgHyhOm6qfy3+xKEpx31A3vkmQshbxaG5vTWtKU9nHNYalRtYbc2QCUYf
 32+NMwjPIOiUoGKTVI6az6RK5Bi4S0+WIlGl+mlRWj+CZ5W7UaBbAO7/eqXCAESi78Br
 +qpjOxyZ9ooOppK1PZQ+4PretnFzTUHXlmX+MQn7hUB8dv5WTHk2HHBDQXqiowC7UAEm
 nBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b6B/E3hhp3X1MulY7MUv+5AZT31ez/1vwG0GYr6mVi8=;
 b=CShGt8Vrrx3iSRNFLeSzKxrysadKAr8sxxHKIZ3NByoI76j36yRr96h8XuN3NvdaRw
 mw8r4zYP0tzHoX6PtGuVp/KMS/j3Z3bJKWDfYaOhfK98tWefEClupTCrga7BNDDiwFq9
 tvdcAxyXYh8fxwt7f4GZBDHTOF5Gs382D6xeAl50RE7eKk8P//8co6KqGehNe8RLDmKN
 GCu6urbb9bKuDTvozcm7O8jxhaviichbs0FqYmX+W/Tn2lQ3HgBBxxyZVXO2Vfl4et5J
 A9f71axsfAPclrdQy8PF8Dal7Dc7jmmONXukh6Kl7kX5qOxxTdesooYtXEnTLJzEC6Tm
 gZDA==
X-Gm-Message-State: APjAAAWJ+uqozZy92BAsLafSmW3wjryWJhGk1yHhQfNW7sg0zvbyfnYg
 4lb1cl4JckiyrfuQAABxJVR1UZ3YDGWzAEHhsJY=
X-Google-Smtp-Source: APXvYqyH8Yopz0oc6md8chhpOW36QC+gxIRmA6KUWxMCjJN0SLLX9pPyR6DPCJ8scz67KpJS7oZHgoPT9L8u+MXFOTk=
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr14913391wrr.252.1561438844581; 
 Mon, 24 Jun 2019 22:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <1561115855-4186-1-git-send-email-open.sudheer@gmail.com>
 <20190621131729.GA9997@kroah.com>
In-Reply-To: <20190621131729.GA9997@kroah.com>
From: sudheer v <open.sudheer@gmail.com>
Date: Tue, 25 Jun 2019 10:30:32 +0530
Message-ID: <CAE-5=DTdo4qDUPRw+Giu=bCcpqu7EdLDt5ddDvqLSgGbuqE1Fg@mail.gmail.com>
Subject: Re: [patch 0/5] *** DMA based UART driver for AST2500 ***
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="000000000000ab7baa058c1ecfee"
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sudheer V <sudheer.veliseti@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 Shiva shankar <shivahshankar@gmail.com>, linux-kernel@vger.kernel.org,
 ShivahShankar Shakarnarayan rao
 <shivahshankar.shankarnarayanrao@aspeedtech.com>,
 Rob Herring <robh+dt@kernel.org>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, sudheer veliseti <sudheer.open@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

--000000000000ab7baa058c1ecfee
Content-Type: text/plain; charset="UTF-8"

Hi Greg,
When i last submitted patches, i have not added change-logs.
and also used custom debugs instead of kernel dynamic debugs.
So i have resubmitted the patches , considering you have discarded old set.
I want to send any changes suggested  from now on wards  with versioning
V1,V2...so on.
Is this acceptable for you? or should i submit the patches again as V1 once
again.?

-Sudheer


On Fri, Jun 21, 2019 at 6:47 PM Greg KH <gregkh@linuxfoundation.org> wrote:

> On Fri, Jun 21, 2019 at 04:47:30PM +0530, sudheer.v wrote:
> > From: sudheer veliseti <sudheer.open@gmail.com>
> >
> > Hi,
> > AST2500 has dedicated Uart DMA controller which has 12 sets of
> > Tx and RX channels connected to UART controller directly.
> > Since the DMA controller have dedicated buffers and registers,
> > there would be little benifit in adding DMA framework overhead.
> > So the software for DMA controller is included within the UART driver
> itself.
> >
> > Thanks and Regards
> > Sudheer.V
>
> Is this a v2 of this patch series?
>
> You always have to version your patches and say what changed from the
> previous one, like the documentation says to do.
>
> Please fix this up and resend.
>
> thanks,
>
> greg k-h
>

--000000000000ab7baa058c1ecfee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Greg,<div>When i last submitted patches, i have not add=
ed change-logs.<br>and also used custom debugs instead of kernel dynamic de=
bugs.</div><div>So i have resubmitted the patches , considering you have di=
scarded old set.</div><div>I want to send any changes suggested=C2=A0 from =
now on wards=C2=A0 with versioning V1,V2...so on.</div><div>Is this accepta=
ble for you? or should i submit the patches again as V1 once again.?</div><=
div><br></div><div>-Sudheer</div><div><br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jun 21, 2019 at 6:4=
7 PM Greg KH &lt;<a href=3D"mailto:gregkh@linuxfoundation.org">gregkh@linux=
foundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">On Fri, Jun 21, 2019 at 04:47:30PM +0530, sudheer.v wrote:<br=
>
&gt; From: sudheer veliseti &lt;<a href=3D"mailto:sudheer.open@gmail.com" t=
arget=3D"_blank">sudheer.open@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Hi,<br>
&gt; AST2500 has dedicated Uart DMA controller which has 12 sets of<br>
&gt; Tx and RX channels connected to UART controller directly.<br>
&gt; Since the DMA controller have dedicated buffers and registers,<br>
&gt; there would be little benifit in adding DMA framework overhead.<br>
&gt; So the software for DMA controller is included within the UART driver =
itself.<br>
&gt; <br>
&gt; Thanks and Regards<br>
&gt; Sudheer.V<br>
<br>
Is this a v2 of this patch series?<br>
<br>
You always have to version your patches and say what changed from the<br>
previous one, like the documentation says to do.<br>
<br>
Please fix this up and resend.<br>
<br>
thanks,<br>
<br>
greg k-h<br>
</blockquote></div>

--000000000000ab7baa058c1ecfee--
