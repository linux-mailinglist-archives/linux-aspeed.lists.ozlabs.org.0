Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F01B173CE26
	for <lists+linux-aspeed@lfdr.de>; Sun, 25 Jun 2023 05:08:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=S1HFlcqs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QpbX23fpYz30fk
	for <lists+linux-aspeed@lfdr.de>; Sun, 25 Jun 2023 13:08:18 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=S1HFlcqs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52c; helo=mail-pg1-x52c.google.com; envelope-from=yulei.sh@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QpbWv2Rv6z2yxt
	for <linux-aspeed@lists.ozlabs.org>; Sun, 25 Jun 2023 13:08:09 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-54fb23ff7d3so1052698a12.0
        for <linux-aspeed@lists.ozlabs.org>; Sat, 24 Jun 2023 20:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1687662484; x=1690254484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mh8y9rGkY0XrishvL/YriS+pn1suafnY/Ovufgrc/To=;
        b=S1HFlcqs8l0XO2V+kdO93mLZSNlhR+kNBtOscaXM8ZAuK+nt+kONB5CmffSF6B17Or
         GMDtkPINo5NY9ahXUTWawPYZ6AjvrjnIHv6sWZKzyTX7/SIFXxvdPvBZ8+hCGEshgwEL
         DdJ858OzfjMUp62a8UA/N/0q9yXDX29eBz2B5NwEeBu+hMT/gXEtggZGs4Yo71x7qg7O
         1NTkGpfambYFBPwK9Y2cbv7b1sW/WLrgHS1w+4p1HA5AovgA+wYnfWBk5mEC2heCbn3M
         mkSg5Y3l4so4E7Fw5w5+GVVFjTM8pR2/q6caVVYl0Kk4aUyxphIAHBRdf3JLHuTZbZo0
         zyhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687662484; x=1690254484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mh8y9rGkY0XrishvL/YriS+pn1suafnY/Ovufgrc/To=;
        b=XhbbrlvNW4C6BOyIwwAcVaNtB1JY9Q9Ca2tpXnQC5l4sdCl0riZGAJpWR/Qwor2was
         RlO6RC6i9teMBzmlKRnzGnF/jy5d9ITgpVjCozWZh+i+s5e8BKgJLoU7iFtB3BK2FuI2
         cU+8xf3JxVxAfBIhuLS0dsrDxEuXfUqsRRBD5RnU7YnhZPuCH34E3SZx3zFXbIuZKbED
         r60XBBeYelkgbnRFUvSF6NL+aYEoAz+PFkuRQ7pK4sS1VC6QtkvKlnU/r6by41asIhFT
         2IFgCqyJEiPbZ7LH8SiTjulLp/woo7Md4yvB758NXoBDPGolpizjGQ8rbu+C9SYZunMC
         q7FA==
X-Gm-Message-State: AC+VfDwVTeOuLlsd41hrxEpv7q31YJ8EZ/klbQ4CEIz+t6qIQVKsoD9I
	4VJzgFG9a/TUAN6cReTpucEuWU7NJLQULMqm5iSUuQ==
X-Google-Smtp-Source: ACHHUZ5g0BtDrRKiJvnE1ZMKauIGJlA4TKSEOVZnrpZZ3VN6xvPFO5CT4Vj7GvFykNxQbh2xUPYgKuG2DDfs6m73I2E=
X-Received: by 2002:a17:90a:bb81:b0:262:a546:e8a2 with SMTP id
 v1-20020a17090abb8100b00262a546e8a2mr2764648pjr.33.1687662484519; Sat, 24 Jun
 2023 20:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <HK0PR06MB32022348EA65805C7109B7D080329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <CAGm54UExHOBw61DJNqxvW67OSr60fQ+Q247t63RzymiMOmHmFg@mail.gmail.com>
 <HK0PR06MB320203EF8E3AD14C34359B0580329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <Y1ueEYJk2epT/g4J@kroah.com> <HK0PR06MB32024F58191E17DC5ABC99F380329@HK0PR06MB3202.apcprd06.prod.outlook.com>
 <Y1uyssu84kl1INSR@kroah.com> <CAGm54UGmp=kTKGLhEfENF4SqkvRt_GcpuGH_g5PjtQiBkwtOsA@mail.gmail.com>
 <TY2PR06MB321303972156248AB08CAB2480EB9@TY2PR06MB3213.apcprd06.prod.outlook.com>
 <CAGm54UHWhRQsvaBQM7mgfP2A5os=mYDTfKS9qfS0C5_9XkcrSA@mail.gmail.com>
 <CAGm54UG2uD2jruRc33Xm4izepYpuFNBBcGe594as8_fx1uEWQg@mail.gmail.com> <2023062146-stony-lair-b6a3@gregkh>
In-Reply-To: <2023062146-stony-lair-b6a3@gregkh>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Sun, 25 Jun 2023 11:07:53 +0800
Message-ID: <CAGm54UGarmoR-LT=hosC3ChAXvV2Pt4=GYWc=cxZV6j3yOo=GQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] usb: gadget: aspeed: fix buffer overflow
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Felipe Balbi <balbi@kernel.org>, Henry Tian <tianxiaofeng@bytedance.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Neal Liu <neal_liu@aspeedtech.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jakob Koschel <jakobkoschel@gmail.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jun 22, 2023 at 12:00=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jun 21, 2023 at 08:02:14PM +0800, Lei Yu wrote:
> > On Wed, Dec 21, 2022 at 10:26=E2=80=AFAM Lei Yu <yulei.sh@bytedance.com=
> wrote:
> > >
> > > On Wed, Dec 21, 2022 at 10:17 AM Neal Liu <neal_liu@aspeedtech.com> w=
rote:
> > > > > > > > > Using rndis is able to set MTU to 2000, and the issue can=
 be
> > > > > reproduced.
> > > > >
> > > > > USB ecm is also tested and it is possible to set MTU to 2000, and=
 could
> > > > > reproduce the issue.
> > > > > So I think this patch is needed anyway.
> > > > >
> > > > > @Neal Liu Could you kindly help to verify the USB ECM case?
> > > >
> > > > How to set MTU to 2000 on USB ECM case? I remember last time I cann=
ot set by using "ifconfig ..."
> > > > Regardless ECM or RNDIS, I agree this patch is still needed.
> > >
> > > You were able to set MTU to 2000 for RNDIS but not for NCM.
> > > @Greg Kroah-Hartman indicated that RNDIS should not be used anymore.
> > > So I tested ECM and verified it could set MTU 2000 and the issue coul=
d
> > > be reproduced.
> >
> > This patch fixes the kernel oops in the aspeed-vhub driver for both
> > USB ECM and RNDIS.
> > It now has an Acked-by from benh and Reviewed-by from neal_liu
> >
> > Should we merge this patch?
>
> Can you please resend it?

I just find that the patch is already merged in v6.2
Thanks.
