Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5617854FB9
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 15:05:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y5wp1555zDqQj
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 23:04:58 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2a00:1450:4864:20::143; helo=mail-lf1-x143.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="cPSybSE3"; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y5wc0XJfzDqLs
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 23:04:47 +1000 (AEST)
Received: by mail-lf1-x143.google.com with SMTP id a9so12585749lff.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 06:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=f3XYF9cuhJkOb6QhXXJ0KUa5YjPq6bukEfwMeyaUtmI=;
 b=cPSybSE3tQ+hJbmv3UirR1NlgETQSrpjuWBZHOikqm6TAw/uu2yco0BLqH9kFCO23V
 dITc+yvMUEcjnMhPuobxbzVaS8FzaZEzoIhAulDCjOZeTohzXSp52CC8xVCYgZzqRCm3
 Uee772Ec+YiWmze4UIGOUHgrxcMLAwHlhzWkvTv0gWxt0LWG2mN8Aszw4CZC/Wv9xv2Z
 CNzIuV69BfnrF5Z3kiXVgd92eDEYwsgrWC8fUZQQKUeq74Me2ztb40bFU1Z1Gh84TntD
 d3YuZ3Ot0ym/AN+At8MKRCPId3Rcd7KZVeE11z1wHTVj9DPkkJ1nPzRAyiEFtizlbQdR
 3iCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=f3XYF9cuhJkOb6QhXXJ0KUa5YjPq6bukEfwMeyaUtmI=;
 b=pwPo3GeGmdvVmeIB8C34I7yvve3jER14nBlKNoaI8KOpkb6VouXKky+fhWMmVq6bju
 eK2OQwYg2uF7E8NWC7xdn+DSMyNw2CB2bDBl2JfsjpHhn5E7ESBX5X0nwp++LTdHmPxy
 y9niD12/eQQHf7yVd+F/v7PcVb0lb8dIO7tz9YlCmQjgEiscFDtLijoftLlnAqMdEJEa
 T3gUlO9qG4M8t5VYCGbaBgIj3SZKR3tjCcVFqXBGGy/T0E5oM8P51Q7YYlHDnd6+TWz6
 hH7nakvg9sCYP/RlfjJfJjOO8vA+eXU6iD9mDci3DUcREEjuszCGhNWCkivQ47btQd9t
 9+cg==
X-Gm-Message-State: APjAAAXiWElHaiMk3vKXiGGRUf/UzkXF1xRKn5HCIx5RsQNn5K+J5LeW
 bRXciNoPUcF//GC2TYJgNyjm7g==
X-Google-Smtp-Source: APXvYqzri3a9/Cw5HhmsmeFZv670j3VThv0a86PRUSWtHQhxo0u4+wnJrkt0lL7kh8Xj0qRLxEDZJQ==
X-Received: by 2002:a19:bec1:: with SMTP id o184mr48295011lff.86.1561467878773; 
 Tue, 25 Jun 2019 06:04:38 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id 25sm2267647ljn.62.2019.06.25.06.04.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Jun 2019 06:04:37 -0700 (PDT)
Date: Tue, 25 Jun 2019 05:21:16 -0700
From: Olof Johansson <olof@lixom.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: defconfig changes for 5.3
Message-ID: <20190625122116.6ah3acqgy5ixxpim@localhost>
References: <CACPK8XfL-U-BeynGQNBp5rPiv1gzD=7DVzyvrgtoL3njU1Kr_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8XfL-U-BeynGQNBp5rPiv1gzD=7DVzyvrgtoL3njU1Kr_A@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: arm <arm@kernel.org>, linux-aspeed@lists.ozlabs.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sat, Jun 22, 2019 at 07:58:46AM +0000, Joel Stanley wrote:
> Hi ARM maintainers,
> 
> Here are some defconfig updates for the ASPEED machines. I haven't
> sent one for a while, so there's a nice collection of drivers to add.
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
>     tags/aspeed-5.3-defconfig
> 
> for you to fetch changes up to 2d8bf3404bb0e65dffb7326f7fb6e96fa3cee418:
> 
>   ARM: configs: multi_v5: Add more ASPEED devices (2019-06-22 17:12:17 +0930)

Merged, thanks!


-Olof
