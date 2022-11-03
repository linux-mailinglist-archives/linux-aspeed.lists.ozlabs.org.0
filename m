Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF62617598
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Nov 2022 05:30:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2rRD2Dsyz3c25
	for <lists+linux-aspeed@lfdr.de>; Thu,  3 Nov 2022 15:30:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jacehTQd;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2e; helo=mail-oa1-x2e.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jacehTQd;
	dkim-atps=neutral
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2rR444qQz2xJ6
	for <linux-aspeed@lists.ozlabs.org>; Thu,  3 Nov 2022 15:30:39 +1100 (AEDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-13b23e29e36so932763fac.8
        for <linux-aspeed@lists.ozlabs.org>; Wed, 02 Nov 2022 21:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=beWe+uN+ON3DnKB4aGPZ3xvAANzoMjyW6vf2PFY929c=;
        b=jacehTQdxGORVtrgfvg0hPn0N5GQ2IUEGiL/11ZLmE5QRgqMbF6clRydJ/bAvwS1O8
         8Z9UR6DiWWKEVePi87bU5voHcQV4UUftDtF/6e95DaD5ELfNE8JHWHhWwkraGlHT/ig8
         jVeu1W283oM+9PRjGW7YZCKVy6Y+RNb+STI4bXXVQI/4SK3STy0z5ozLwJ7779WSKKvP
         z84gR7ImXU45qb4g7G4KfA4XepQw63t0iJzOVlrVzotBWrSuaJOIJalsiBwyDhXJ4jTV
         aSlLd0jNwOjRv85WYRIR5emtjHLsA7hQuNulGRxDWHQkyM41tHOLr/kpaknE0i/eknpt
         Ok4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=beWe+uN+ON3DnKB4aGPZ3xvAANzoMjyW6vf2PFY929c=;
        b=Xtk7j/lCArTqbzGlpxgWGzELlBqnhdQXQJNj+HQqAEkqNInTiTPBA0KbqIdysUs6UN
         nSUb2VmOsJ7u0rCnL0s1sIpCLc+VEIlCEOYK/oQfGtmCphil1dcJzGfYsT9mXfazeOc1
         fdFEEpVRO7t68ti+gABIdIkVxW5T01x+YkmN4zcd0Gaq297yUqZfOREoT0OsqdbFQgE/
         jx1ii6GnYyFUeBjjJZvuSzHWvBQWIm+2YMyTzD/PrGvEHbjSH7E8E+6VYwV5e6T5q77f
         dm0o9+p+0qZSanR+bAVq2LaURk1MLu91bHH7EjwTOp9zHKAx1B71VqxofhUy6UCNZB4d
         Eq1A==
X-Gm-Message-State: ACrzQf2Fl1+WHFnQcxE3ZFMRU6/Bhd7lhCoQ7Trl0RBGnQqo2WEaBD5E
	kK7RGa9LRpRvmekPj2peLGE=
X-Google-Smtp-Source: AMsMyM5/TXw3maOdtX+B4EYEcC9BeJj3uMEM0QxNLDKW/206hGsoRzr8X5YYyqpVqpk3jT6Tc3lf4w==
X-Received: by 2002:a05:6870:2487:b0:131:4fee:aec2 with SMTP id s7-20020a056870248700b001314feeaec2mr26066038oaq.69.1667449835919;
        Wed, 02 Nov 2022 21:30:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i3-20020a4addc3000000b0049201e2b8f4sm5150583oov.4.2022.11.02.21.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 21:30:35 -0700 (PDT)
Date: Wed, 2 Nov 2022 21:30:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [v2 3/3] hwmon: Add Aspeed ast2600 TACH support
Message-ID: <20221103043034.GA2113834@roeck-us.net>
References: <20221101095156.30591-1-billy_tsai@aspeedtech.com>
 <20221101095156.30591-4-billy_tsai@aspeedtech.com>
 <20221101131456.GA1310110@roeck-us.net>
 <271C521D-8F20-4C86-B3DA-9C0AD74242D4@aspeedtech.com>
 <20221102170138.GA2913353@roeck-us.net>
 <F1166366-99CC-4A36-A0A2-4965C787E60B@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F1166366-99CC-4A36-A0A2-4965C787E60B@aspeedtech.com>
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
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "garnermic@meta.com" <garnermic@meta.com>, "jdelvare@suse.com" <jdelvare@suse.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Nov 03, 2022 at 03:52:59AM +0000, Billy Tsai wrote:
> 
> Can't I use a min/max RPM to let the driver know a reasonable timeout/polling period when
> the driver is trying to get RPM?
> Beacause that our tach controller have the falg to indicates the hardware detected the change
> in the input signal. I need the proper timout to rule out slow RPMs.
> 

If the chip measures the fan speed continuously, why would that ever be a
problem, and why wait in the first place instead of just taking the most
recent result ?

Pretty much every other driver is doing that, so I really don't understand
why that would not work here.

Guenter
