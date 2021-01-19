Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A0A2FB5F5
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jan 2021 13:04:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DKnQY4hngzDr1D
	for <lists+linux-aspeed@lfdr.de>; Tue, 19 Jan 2021 23:04:53 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=fercerpav@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OTt/HPQ1; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DKnQH3kHlzDqNn
 for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Jan 2021 23:04:36 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id 23so28675825lfg.10
 for <linux-aspeed@lists.ozlabs.org>; Tue, 19 Jan 2021 04:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Dj35Y10xvadEoj4O3QQAv08yPioskFbVaeePKmUZ9Uk=;
 b=OTt/HPQ18ep/L5BQjn0d2sUCrTGC/Eb4Pc7xsKgfQHwU8n7OQPpqQwwWnuLfwgSCwc
 moSPENoto5XgW6Xn2Icf6eRj2iQEoDviYkXjqAqtot/1l9nVW0HwZK+epzIl721H+Mzd
 1QD+hVWp2vE3ofoDobxXyeJf3cjOqbK++JvdC9FkbzerJIzy+q9F6BPLfsbVBS3ZFY5l
 KfYz64mbFZNMrjIgCl9qJBk15ddrGeGhW03U8dCE8mssEOHWmsuqJ6emCHvym2/ar6nf
 9FDnMXSJ0rU1Odei8mUWjPpWLYgh1DoWKNctx6tb/Nzk3B/GBYgiQNLgs5tSOeEZZJrc
 0MdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Dj35Y10xvadEoj4O3QQAv08yPioskFbVaeePKmUZ9Uk=;
 b=NdPYoIhsotl1v+Ch9DurSTxrHowaLiFW6rrQWC+aGmNQ4vfEcRB91sIYshuHsnTmSe
 a1FFQ19oDYxm42ToNFlYzJJWdsM8JkA2Lnq9fb5J3Gzc0qFNg8dlNAOH7dm5vEaRcVd7
 yFxBWoiRFLNrtm8dYR3WYcaorleokVZmKRhNLLeiPyoWftyQh0LfIdeqJlTYmU6LMmO5
 w/wTLh3Yj9Dhwl3EDm9MD8mJRJgASp+UyyKPPz4dwW/kSII0cfJjrvJDnVIN0WrlLfFD
 ihJMwbTAJtf5DYMrKDqR4iLa5HsVUSRqlQUMnRUmpfnaTkv+u64hVTRO9nQD7Qe+0CxB
 006w==
X-Gm-Message-State: AOAM53385shCBzwQWnKwT/hu7CIxld4VmHAu1DXRuP6g4RYoy1t7r71g
 PzNlKTiy/2sMoydf5uCC6CA=
X-Google-Smtp-Source: ABdhPJyKNYJ/6ghlt3pcnWSiKLntUja0K0OPnDzu3Ijj1aZpbb/PUweZfO0FMXBUIReFejQilX6ZPA==
X-Received: by 2002:a05:6512:33a8:: with SMTP id
 i8mr1895774lfg.5.1611057872008; 
 Tue, 19 Jan 2021 04:04:32 -0800 (PST)
Received: from home.paul.comp (paulfertser.info.
 [2001:470:26:54b:226:9eff:fe70:80c2])
 by smtp.gmail.com with ESMTPSA id h1sm2265819lfc.121.2021.01.19.04.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 04:04:31 -0800 (PST)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
 by home.paul.comp (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTP id
 10JC4RAh015519; Tue, 19 Jan 2021 15:04:28 +0300
Received: (from paul@localhost)
 by home.paul.comp (8.15.2/8.15.2/Submit) id 10JC4QTg015518;
 Tue, 19 Jan 2021 15:04:26 +0300
Date: Tue, 19 Jan 2021 15:04:26 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Ernesto Corona <ernesto.corona@intel.com>
Subject: Re: [PATCH v29 2/6]  dt-binding: jtag: Aspeed 2400 and 2500 series
Message-ID: <20210119120426.GE2971@home.paul.comp>
References: <20200413222920.4722-1-ernesto.corona@intel.com>
 <20200413222920.4722-3-ernesto.corona@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413222920.4722-3-ernesto.corona@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Theodore Ts'o <tytso@mit.edu>, Arnd Bergmann <arnd@arndb.de>,
 linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
 Steven Filary <steven.a.filary@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, Jiri Pirko <jiri@mellanox.com>,
 Rgrs <rgrs@protonmail.com>, Eric Biggers <ebiggers@google.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Oleksandr Shamray <oleksandrs@mellanox.com>,
 Patrick Williams <patrickw3@fb.com>, linux-arm-kernel@lists.infradead.org,
 Vadim Pasternak <vadimp@mellanox.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Apr 13, 2020 at 03:29:16PM -0700, Ernesto Corona wrote:
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/jtag/aspeed-jtag.yaml
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +      jtag: jtag@1e6e4000 {
> +          compatible = "aspeed,ast2500-jtag";
> +          reg = <0x1e6e4000 0x1c>;
> +          clocks = <&syscon ASPEED_CLK_APB>;
> +          resets = <&syscon ASPEED_RESET_JTAG_MASTER>;
> +          interrupts = <43>;
> +      };

It's nice to have an example but shouldn't it also be included in
aspeed-g5.dtsi as part of the patch series if it's known that the
driver works on those SoCs and the peripheral is always present?

-- 
Be free, use free (http://www.gnu.org/philosophy/free-sw.html) software!
mailto:fercerpav@gmail.com
