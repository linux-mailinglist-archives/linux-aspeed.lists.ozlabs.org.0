Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 697918D19F
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Aug 2019 12:56:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467mjX1hpHzDqsH
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Aug 2019 20:56:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=lee.jones@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="SdT02fPi"; 
 dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467mgT6JZ8zDqpd
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2019 20:54:45 +1000 (AEST)
Received: by mail-wm1-x341.google.com with SMTP id p74so4185099wme.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2019 03:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=tT1WBkErjAogTXzuIr64b4Ipw6zSwCNCCPdgxI3cPic=;
 b=SdT02fPizF4VsboyubypNXDpHVLnbdZbIsuPH+ovAlV5oBYyfxf+IqaHkW/lXVSOgg
 kwC+GscgHbhE+BM34hlIzT1cHQV6ngH7tNC6TG6DmwZgNBLe2MCZ3Jmg07GXmPHYOjbr
 k8NQN/NtlfNnCZyMXOYOJxsiWf1JmP53Mq5BITPOgRDzYyO3Cs8pF9uq2ZIMQNO8QJF9
 o884eKSq00ZGTYrgQWUjcD9Rs6p7yHWWqjEpnGMmjiHchQLPx/2yM62XgRZYSEQ7tqg2
 rDfQ/uBtjTxdZcZUQXerWQzzjolGQb0sTjZZnUuqFYftQRe7QZM7gpY1vADKoRV3FXTd
 puUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=tT1WBkErjAogTXzuIr64b4Ipw6zSwCNCCPdgxI3cPic=;
 b=VjLnZ/XGF0vV6HNpecLteQE7m3dw/f7OKzA8tqYkSqNunpXATwK1xQQ8MrB6QuMTnY
 eQaoD7u6Pcsm8wNM1VbTeo7y/BIguOrWPI1WFSHn9ZfMjZuJI4dTAcKZB2IUYCUdsgp5
 15kF7hNVKB2w3qrWP/tYk9EpXTsPlKEZsci4pvQVOeUmzuzTh7Ev1GugsRSoa5/YVIL3
 U2rAZT0/avT5eR9GqwxpQB70JDphlqKbpw6EjmeBaE4x9Wps0c8uqLfAQ5f+mMhuJ1ju
 bloCNn9elFhvNZB88nXXfiq/PrNuES2pVF/7FWvH86HZFPuo4sEgd9OdJHl6QdoogY9P
 qItQ==
X-Gm-Message-State: APjAAAVHSXa94xUL59+hTKWQ6l0yBpmudeFhdm2ETI0Wc+h1YtFRFPWb
 KH+Fw3kNv1H5HDj0sBMIRy5UiQ==
X-Google-Smtp-Source: APXvYqyKLin58q1G/qvQ8vEt+Ct9hq4RH5l/rpi6T0U8tdIutWirP+pgkhY/ww5FQqvj81PeYCpPOA==
X-Received: by 2002:a1c:a8c9:: with SMTP id r192mr8019337wme.43.1565780080798; 
 Wed, 14 Aug 2019 03:54:40 -0700 (PDT)
Received: from dell ([2.27.35.255])
 by smtp.gmail.com with ESMTPSA id e9sm2998336wrm.43.2019.08.14.03.54.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Aug 2019 03:54:39 -0700 (PDT)
Date: Wed, 14 Aug 2019 11:54:37 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] dt-bindings: aspeed: Remove mention of deprecated
 compatibles
Message-ID: <20190814105437.GE26727@dell>
References: <20190724081313.12934-1-andrew@aj.id.au>
 <20190724081313.12934-4-andrew@aj.id.au>
 <CACRpkdZCJWeZO6CFvkq4uhnX+o_q_AfkDZ=a2kmUgbS3JtDqfA@mail.gmail.com>
 <20190812101504.GF26727@dell>
 <CACRpkdapA_-yp4ihY3S+CHMmDMKU2b0u=sj2UhJ-cvv39Dji_g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdapA_-yp4ihY3S+CHMmDMKU2b0u=sj2UhJ-cvv39Dji_g@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 14 Aug 2019, Linus Walleij wrote:

> On Mon, Aug 12, 2019 at 12:15 PM Lee Jones <lee.jones@linaro.org> wrote:
> > On Mon, 05 Aug 2019, Linus Walleij wrote:
> >
> > > On Wed, Jul 24, 2019 at 10:13 AM Andrew Jeffery <andrew@aj.id.au> wrote:
> > >
> > > > Guide readers away from using the aspeed,g[45].* compatible patterns.
> > > >
> > > > Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> > >
> > > Patch applied to the pinctrl tree.
> >
> > With my Ack?
> 
> Sorry no. :( Was I too trigger-happy?
> 
> Usually I take Rob's ACK as authoritative for anything under
> Documentation/devicetree but if you have concerns about the
> patch from an MFD point of view I will revert it pending further
> discussion.

No need.  I would have Acked it.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
