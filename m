Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8A04DBC18
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Mar 2022 02:11:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KJpyJ3n1Xz30Df
	for <lists+linux-aspeed@lfdr.de>; Thu, 17 Mar 2022 12:11:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g7r7I95U;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112c;
 helo=mail-yw1-x112c.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=g7r7I95U; dkim-atps=neutral
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KJpyB18fWz2xTq
 for <linux-aspeed@lists.ozlabs.org>; Thu, 17 Mar 2022 12:11:43 +1100 (AEDT)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2e59939b862so42443447b3.10
 for <linux-aspeed@lists.ozlabs.org>; Wed, 16 Mar 2022 18:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HihXKlHycjx4RswzLPo//YprAlmxVU5qmWi+4h7HrVM=;
 b=g7r7I95UXH97tR/0xx/CeaXFKin4xe7Fhjf/ILcQ2mQpd2wG2TAjOR3CEgBMIMUWbN
 z5dl3wI9u0+8RPblANkWrUypLbH6BnYWhnCHrEGuvOdZXJgtsNFHY7POvvDqFrYTBwXH
 4o23XQt/4em5W5oEIUXcIuQT0mAx/UeqTNsbl6l6ZLEzFoF3bBVBNvrU2d6kuNzfdNxw
 jY4mlT8JSf1WMIugg+dQN+EFs2V1jBMOICUADe437wdEmzwUsxzegeq2RSeyRVjOxfsm
 12ZnpV8Uhwl989A7k+l5iTYJFxi1l9Dkx+y/ldwoXePCzh9IzELS+67vAmlKy4c7AClH
 qX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HihXKlHycjx4RswzLPo//YprAlmxVU5qmWi+4h7HrVM=;
 b=cSKUGpKiVWvh5vqFnu/ukGJiz78i6mz4rJlIBqZN4zj8DvWGEz7YmHVNbc7bb8sgzQ
 uGjPrTz5e/jYmBQXyXEx4fkWdKUpe1j4I/ulePMJNquspbSjoeMNGJ6C8/OFB0wwbysx
 uf+MJ8yushkkH40XOFYP22FYRUYPAvK3Bm6sOUEUQYYWoK3oXqQRPszG00+e1czXOHVy
 ATCSHqWFYdKYwfZcfT2Hm7kbpI6VY/D0ZTtrCHkWFoL43AwoX3/DUM05kBAEYdPZm7G5
 ASsSZ7dW0AWpe+b8rw1LnE/52/FgpVOICcP5R3hxb20dNGSg9UdDay9Fv/jIdwNjO5qT
 onBg==
X-Gm-Message-State: AOAM531/bFqU5V2Bf+CM1fPDCw8QpYbEhgwp2NZQTEMvqmNYjKRi5p1x
 o4qcT7ZpwMKgi2NNdtuOsoj2uOwOt3nupP/v2WSidQ==
X-Google-Smtp-Source: ABdhPJyWmAaWK1aeShbp3JXnJNVTEdEba4dWiBZbV73y0uTMQXzTrgv3goP2pT+5pEG0BKeuQMivJDtEifudSMlU/6o=
X-Received: by 2002:a0d:d68e:0:b0:2e5:9f48:a24a with SMTP id
 y136-20020a0dd68e000000b002e59f48a24amr3230663ywd.151.1647479498884; Wed, 16
 Mar 2022 18:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220308003745.3930607-1-quic_jaehyoo@quicinc.com>
In-Reply-To: <20220308003745.3930607-1-quic_jaehyoo@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 17 Mar 2022 02:11:27 +0100
Message-ID: <CACRpkdbFNLLve1-JntNW=eMT9ivZTZHBk-xpwK6w-kE0fczr+g@mail.gmail.com>
Subject: Re: [PATCH 0/5] Fix AST2600 quad mode SPI pinmux settings
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Jamie Iles <quic_jiles@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Graeme Gregory <quic_ggregory@quicinc.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Mar 8, 2022 at 1:37 AM Jae Hyun Yoo <quic_jaehyoo@quicinc.com> wrot=
e:

> I=E2=80=99m sending this patch series to fix current issues in AST2600 pi=
nmux
> settings while enabling quad mode SPI support.

Patches 2 & 3 applied to the pinctrl tree.

Please funnel the DTS patches through the SoC tree.

Yours,
Linus Walleij
