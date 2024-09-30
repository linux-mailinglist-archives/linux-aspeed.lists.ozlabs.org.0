Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 834E198B065
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 00:46:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHbkr5mg6z3vZx
	for <lists+linux-aspeed@lfdr.de>; Tue,  1 Oct 2024 08:45:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727704861;
	cv=none; b=NFLMU5jFMnfU6CnTwNypV21M0AldPDB0ZagN500GIRczbAs2yUDk1NxU0oZO25povk6C6LMCZDp4fe+DHladzjTy5ZkdYkkWyxtxg0jBpt+UmnLJTqAaZb1hDtU3V57U8/2u7c415l3nA9uYT2KDkQsWtxGyz7VY9Np5PJBe9ybvjdsU7q3Xgqtil1rImCleahFuxLcw5ZLyRTHS8e0eVtUKGDPKBIrmFm3v/8PoZnqOq43U8vGSo+UfCRbzwSZvRvoADrh27JC/JvAo1MrL8WC3DBmHEcnIOOiQxtABs9srrS3lMOtYU5vQBJYOILj1Ayl2w2P5IOvBEv2edQ0N3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727704861; c=relaxed/relaxed;
	bh=B9iC2N/12abllbC0V03F2t6+J5vMpvZXd0nYPLT3vBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPko+oPw78/tQGsU8xqr420sKsYlhZTwdl6Pk/OLzrgjOcU7oHEcDVL5PHBfCz6BWfiNXFIM1AQpEEfXQKYsywhpjBOBGPiVhpa458dLi5G/+lViLZGgjgjEk64+csBdadKGKekm2btjwAxv3npCDi7Ve+Fe0lmh0TrMfmzsD01YReMXW4WwjJqvKGS17ul8mXWTN0RVBoubtBiAZmGATbo6PrF+VyqCYGRG2lNjF8KnhGBTjRUUi6p9+VYLCM+mndl6+gai5tWIaL7LnmmxfULZ158eHzkMXlpXFJqpNLiUt9wyC1xVfWUbi4zbBI1QpLw/oUtmAflpWy/RIROFgA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O0p2MbNK; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=O0p2MbNK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHN5S6HkXz2ypW
	for <linux-aspeed@lists.ozlabs.org>; Tue,  1 Oct 2024 00:00:59 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a8d60e23b33so666168066b.0
        for <linux-aspeed@lists.ozlabs.org>; Mon, 30 Sep 2024 07:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727704853; x=1728309653; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B9iC2N/12abllbC0V03F2t6+J5vMpvZXd0nYPLT3vBQ=;
        b=O0p2MbNKrOAQdccDkhpOR2LeNXCm1U0wZ2Jf4vKd094FdqT9TViYeWd3ZxuGz1sBTQ
         B32phJHXU+XCDwm8eOBzbAB2viQRMg5P5RRMj/kmdtuO+Hq9TXkafh7bWC0LDz3qXMME
         uzDODBdPfOd144rnsxY81WsRZkjh5TNXdxn2cCBe6OZmwP7bebOWbGWjhZQEqXUYyp7X
         NPjE1EChEIfgWggtiieoKHByyx8PmiLKguhrY3Qcz40K5yfESaa8YO2SbkejHR2URrn9
         ZTy5AVo44dNrpMAO5WHK9xac7NaiBZMbj2BPAmtpMVe359Oea46T7seNxf/l5JyvFlrU
         rDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727704853; x=1728309653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B9iC2N/12abllbC0V03F2t6+J5vMpvZXd0nYPLT3vBQ=;
        b=u9aJGqVZS4QxQrVLJ7qXgOpYU58SbDOF2O62ZXIfYl4Pz6HkGZTmNjvn/Ev55tmh8n
         m6TXs3T6jK0i8nanYhtGvkfDs/VqgCzM9AHVTxSGs0i7INIHMzrKVJ2YUicQjB/yAW1x
         Xsqlf+a6LaR3r4F7jWONNwvovCwM71+FNukY9Ox86muU5Wn+ZQDuIs9lJwkhrO3otk7A
         VW0nOsnTNZJ7pwiTKoTA2VAb8C5ErPYbMZ/H1YxFDakVCsTIihDAAEKFJEW8jCpmhAg2
         s4u8uHNTANqRgJ7e7LUSs/XWR+ovM2bI9HTfCyQsrQrbklLBv66GjeXGGcILvwoocWEp
         ZZmA==
X-Forwarded-Encrypted: i=1; AJvYcCUMWLf/if+/6LxfP/ZXq1OiHv/euxst1+JovK0CEk0z/4kZZal/yAJ9sOMSdW09MErHV6YcMb5Qh0hqVdk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywl1PKzvAnS7jwZb/JBYhTB3R7c52aVXDGDXR2NYXJGSDL/cKP9
	J9WcrYr4vlZ1AccwnwtMAevCo3Xq7tPEgrW6ZZpOHrb0kDN3RRJK0Ea3pzW2QGI=
X-Google-Smtp-Source: AGHT+IHrW1k6OyoeAr7X2J4sCHCj9NzoUl8sq6E2Ub0OP+VdkpEDGrA+mzsk7GWeJcQA5FmXlP3tnw==
X-Received: by 2002:a17:906:c104:b0:a86:b762:52ec with SMTP id a640c23a62f3a-a93c4adf8ebmr1289043666b.51.1727704853182;
        Mon, 30 Sep 2024 07:00:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c297bceesm532099966b.187.2024.09.30.07.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 07:00:51 -0700 (PDT)
Date: Mon, 30 Sep 2024 17:00:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Walls <awalls@md.metrocast.net>,
	Julia Lawall <Julia.Lawall@inria.fr>
Subject: Re: [PATCH 00/45] media: Use string_choice helpers
Message-ID: <f04f0057-626b-471f-b0a4-56ba30dbf8cf@stanley.mountain>
References: <20240930-cocci-opportunity-v1-0-81e137456ce0@chromium.org>
 <20240930122157.GF31662@pendragon.ideasonboard.com>
 <4873f3a0-bd82-4ace-a783-10ea137284d6@xs4all.nl>
 <7D358236-19F8-4F94-89A0-F379F193971F@md.metrocast.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7D358236-19F8-4F94-89A0-F379F193971F@md.metrocast.net>
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Tue, 01 Oct 2024 08:45:20 +1000
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
Cc: imx@lists.linux.dev, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sean Young <sean@mess.org>, Hans Verkuil <hverkuil@xs4all.nl>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Fabio Estevam <festevam@gmail.com>, Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, linux-aspeed@lists.ozlabs.org, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sergey Kozlov <serjk@netup.ru>, Maxim Levitsky <maximlevitsky@gmail.com>, Patrick Boettcher <patrick.boettcher@posteo.de>, Mike Isely <isely@pobox.com>, openbmc@lists.ozlabs.org, linux-staging@lists.linux.dev, Olli Salonen <olli.salonen@iki.fi>, Bingbu Cao <bingbu.cao@intel.com>, Tim Harvey <tharvey@gateworks.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org, Abylay Ospan <aospan@netup.ru>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Hans de Goede <hdegoede@redhat.com>, Jemma Denson <jdenson@gmail.com>, Michal Simek <michal.simek@amd.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Andy Shevchenko <andy@kernel.org>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>, Zhou Peng <eagle.zhou@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sylvain Petinot <sylvain.petinot@foss.st.com>, linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Shawn Guo <shawnguo@kernel.org>, Ming Qian <ming.qian@nxp.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Sep 30, 2024 at 08:57:44AM -0400, Andy Walls wrote:
> No human being really code reviews sweeping editorial change like these thoroughly.

I wonder if there is some way to verify that people are actually running the
Coccinelle script that they say they are without doing anything extra on the
side.

I use a script to filter out mechanical changes.

https://github.com/error27/rename_rev

It's kind of a pain in the butt to review something like this.  The command
would be something like:

rename_rev.pl -e 's/(.*?,|^\W+)(.*) \? "enabled" : "disabled"/$1str_enabled_disabled($2)/' -e 's/(.*?,|^\W+)(.*) \? "enable" : "disable"/$1str_enable_disable($2)/' -e 's/(.*,|^\W+)(.*) \? "low" : "high"/$1str_low_high($2)/'  -e 's/(.*,|^\W+)(.*) \? "on" : "off"/$1str_on_off($2)/' -e 's/(.*,|^\W+)(.*) \? "true" : "false"/$1str_true_false($2)/'  -e 's/(.*,|^\W+)(.*) \? "high" : "low"/$1str_high_low($2)/' -e 's/(.*,|^\W+)(.*) \? "read" : "write"/$1str_read_write($2)/'

For every email in the series there was another new str_foo_bar() function so
the command line kept getting longer and longer.  It doesn't work perfectly, but
it's often good enough so I can spot the interesting bits.

regards,
dan carpenter

