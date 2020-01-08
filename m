Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DDB134DB3
	for <lists+linux-aspeed@lfdr.de>; Wed,  8 Jan 2020 21:34:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tLYx5nWnzDqQM
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2020 07:33:57 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tLYP2bMVzDqS8
 for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Jan 2020 07:33:28 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id 19so4931465otz.3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Jan 2020 12:33:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=u9lGx1KGncwRhu5gmclKsigxLVgAIjFaP4Z6LNjc8ZM=;
 b=iZMbfmkyu0qZzluNWob/VWr78OJeqV80uFwCStjUJNuuNZhSdlnELy6xbfLBLoqGLT
 XDcFFE1d1Os6qRwT5s4Wt1iu8dPwwlUyU7ATYbSCDv+ILLWmRuG8yL91N3d4AwbwtKnc
 GUha6LwUy6yv0/aNZVlcEi7jyviP8tSlR69QigUx8u2K+ZsLGQA7xVZJ3+YDmjgD06JV
 yNcsR+DwcioTtfFDBv4gm7NpVhAQEgnN7IBE0NmV2Nm33H5aEiWgyT/Qnp/r6S/ALg2L
 wtdmt9pR4KPxBHRWapW90HutAeCSJ3UY98BRelVH7VhGK+jXzk2u6OLDN66RuLEtx3RZ
 LaNA==
X-Gm-Message-State: APjAAAV/yW+jy5owXV9Dlb7SWBS58jdr9wSuL7afdkBoUl70JArnNImV
 ABTmEzM8wqSrv+TLKzXm7rD0JdU=
X-Google-Smtp-Source: APXvYqxxkxScoi4G/PW+f1fEvjS3AkL+XwCcn3QXs7J7BuzsaASWibmKjaVNJlvfVeqCBW4YajGp6A==
X-Received: by 2002:a05:6830:9a:: with SMTP id
 a26mr5720824oto.131.1578515605361; 
 Wed, 08 Jan 2020 12:33:25 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h9sm1425297oie.53.2020.01.08.12.33.23
 for <linux-aspeed@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 12:33:24 -0800 (PST)
Received: from rob (uid 1000) (envelope-from rob@rob-hp-laptop) id 2208fa
 by rob-hp-laptop (DragonFly Mail Agent v0.11);
 Wed, 08 Jan 2020 14:33:23 -0600
Date: Wed, 8 Jan 2020 14:33:23 -0600
From: Rob Herring <robh@kernel.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH 2/3] Documentation: dt-bindings: media: add AST2600 Video
 Engine support
Message-ID: <20200108203323.GA18757@bogus>
References: <20200107011503.17435-1-jae.hyun.yoo@linux.intel.com>
 <20200107011503.17435-3-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107011503.17435-3-jae.hyun.yoo@linux.intel.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon,  6 Jan 2020 17:15:02 -0800, Jae Hyun Yoo wrote:
> The AST2600 has Video Engine so add the compatible string into the
> document.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/media/aspeed-video.txt | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
