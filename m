Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 679AB47CADD
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Dec 2021 02:42:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJbfk27VBz2ywV
	for <lists+linux-aspeed@lfdr.de>; Wed, 22 Dec 2021 12:42:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=Hodil8n7;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=Hodil8n7; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJbff6g24z2xt0
 for <linux-aspeed@lists.ozlabs.org>; Wed, 22 Dec 2021 12:42:18 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id l11so847387qke.11
 for <linux-aspeed@lists.ozlabs.org>; Tue, 21 Dec 2021 17:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PCN9MbBbsSLQre2+oydcyhTYZYw9WIy7kClZtsQdVGI=;
 b=Hodil8n7Mt8VfemZoZNHNMvamNcrtiYAv02Ce8X4y5Pxv0KHIIS4S6OUmNqR6VKb/I
 2LvR5VCXlnjf/AuA1RVpV/PP+6zIP1znHhVk84y+/7LhCHBd2xcKYqmwBgZyF4N0nYEc
 mE10s6w7CgRCvZ16BzPQcs9k0rUOhLG3P8bH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PCN9MbBbsSLQre2+oydcyhTYZYw9WIy7kClZtsQdVGI=;
 b=uudYDUyM44e4Jd2QiaO2yVNs+q6gfexS0SN1qhlJUnGxnim1xnXjfHqoD92Ino4t5R
 Ma2M9OgAu8JcO6R7MSac7G+4t7mdmE56oITCypxtHqRpLSg6qhF+3389YeHhm5AydIPr
 T1Cv/V83GWGktSc2Y237ZEZNANu6foUcvMGmSKlApVAsuQ5PBuLtWnV5gH4vBS6BFBvV
 SudZQRDXLFqkCSXChnCvDBqLtQO6+sc9QsgnXYH2E5VToL2ETiQT0q//B4goj6BlzKJD
 2x6kBrZ+Dps9vz0ut/R1CHZIK8xxw2zFQLePQsOvBnsRONrdQQMhpaSlEUQHJpAJMQaF
 FoGA==
X-Gm-Message-State: AOAM533OAl24/cWSID31EqIyegGvMZvuvWV11ZnERsKRn7g8Jo95flP0
 Jxwyd4xAd7QQ133/O8YmBy5DADzMh866xX4GpXg=
X-Google-Smtp-Source: ABdhPJwmJ9i4jMsvi4V6fz7AloWq/zVOcLqmADCy9D0Hm4pUYF7rzmNHvE+3eh7PMM5aKtpxu3YC39924vWtAqxG3uU=
X-Received: by 2002:a37:94c2:: with SMTP id w185mr746817qkd.666.1640137335360; 
 Tue, 21 Dec 2021 17:42:15 -0800 (PST)
MIME-Version: 1.0
References: <20211207094923.422422-1-howard.chiu@quantatw.com>
 <CACPK8XddhFn3PreJM3D=djkREgqGD7yZhS7YoqxxXsNfhZpLhQ@mail.gmail.com>
 <YcH2MSByPLAvw5mI@heinlein>
In-Reply-To: <YcH2MSByPLAvw5mI@heinlein>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Dec 2021 01:42:02 +0000
Message-ID: <CACPK8XcNSO9pwJiL_-0jyCSZ5jxdY6HdU5MDReByMcRbyeA6yQ@mail.gmail.com>
Subject: Re: [PATCH v8] ARM: dts: aspeed: Adding Facebook Bletchley BMC
To: Patrick Williams <patrick@stwcx.xyz>
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
 Howard Chiu <howard10703049@gmail.com>,
 =?UTF-8?B?UG90aW4gTGFpICjos7Tmn4/lu7cp?= <Potin.Lai@quantatw.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Howard Chiu <howard.chiu@quantatw.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 21 Dec 2021 at 15:43, Patrick Williams <patrick@stwcx.xyz> wrote:
>
> On Tue, Dec 21, 2021 at 04:37:55AM +0000, Joel Stanley wrote:
> > Hi Patrick,
> >
> > On Tue, 7 Dec 2021 at 09:52, Howard Chiu <howard10703049@gmail.com> wrote:
> > >
> > > Initial introduction of Facebook Bletchley equipped with
> > > Aspeed 2600 BMC SoC.
> > >
> > > Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
> >
> > Are you ok for this one to go in for v5.17?
>
> Yes.
>
> Reviewed-by: Patrick Williams <patrick@stwcx.xyz>
>
> Would also appreciate if you could apply to your Aspeed tree for OpenBMC.

Thanks. I've done both.
