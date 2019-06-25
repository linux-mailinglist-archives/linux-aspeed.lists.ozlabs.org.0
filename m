Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF86A54FBC
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 15:05:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y5wz0TLKzDqQh
	for <lists+linux-aspeed@lfdr.de>; Tue, 25 Jun 2019 23:05:07 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2a00:1450:4864:20::141; helo=mail-lf1-x141.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="o+Ab9LUk"; 
 dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y5wq1NWLzDqQw
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 23:04:59 +1000 (AEST)
Received: by mail-lf1-x141.google.com with SMTP id a9so12586504lff.7
 for <linux-aspeed@lists.ozlabs.org>; Tue, 25 Jun 2019 06:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=kBev9BNjHzl4Q2/BQXh/tLq6nIvoU+mOJhmxYqO9F40=;
 b=o+Ab9LUkViKhC9BBighGPDC9tscepqiufmmSc4gn1NeJ0EkO4uJw3XnBTXWAuhy0wH
 BpKR9LMFxfWRiuwTJmYF8KBodCfw4uL918sJsJY9GnR++jphAqjanw/F2bP5yhPbxyU4
 cFOymUeX2LwsY7OrfM3OGTrR0Yk63foTvpNYYzoIIWSUl23Bsg0iJC1kJ9oQtt73N/lZ
 +Qm2YcN21WptW5WLQCprgmh0q4ezfy6Yg9W9mq9hz4HGtcSMRnbu9xS1pFIP9BNOSx3J
 +H/iLZNDlQ4aN9fA5Yd8mxY7ciG3czAq9Fu+x9mMB/rrsHwLjpbTsQMQgARKU7q6IWB8
 qPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kBev9BNjHzl4Q2/BQXh/tLq6nIvoU+mOJhmxYqO9F40=;
 b=uCYw/LrSxXz1dLndVvaT+a9yn+JEEmCKXUwBlCCkycmcS3qgnbyyG7X5khxBPXYB/F
 i4iU/crt1o1h2Gj+otapk/keCo1lk/Ydz5jU6I1pjwHwOysXGDBsW5mxzSNi+TcQlQaS
 WCfXe9d4oHL2rYjfk9jtUR8wvNeF5pu6eqxIwLRBzBhl8lItLs7uIvepxdwGZ4DIaM8F
 eHwNP7ivD6TRGO9DWOAVLmW9iLv+dP85HZSnQXVGb9tgYdw4R8OLdT4wwVdqDauGsg+3
 gD5xE1g9xKkm6dL3MICUn1zUxBWv/jilUFm9DlmqwS1J5fTlv4f8KtA7wwpj4yUs9aPh
 YN8w==
X-Gm-Message-State: APjAAAU4rrNXaApxUqJgvP9U9ZYwCGaiipX1mEGTKejwZU2JCWd0y/1K
 5FI2sBteT3herNlXRgPwW8h09g==
X-Google-Smtp-Source: APXvYqz8LlZT+sjTMv7dxX6avNHS2yBP6pUtrc84HUNGxbUm98TYaZFlTrlLTdb+jwv8F4XP0hPjXw==
X-Received: by 2002:a19:491d:: with SMTP id w29mr2449222lfa.149.1561467895500; 
 Tue, 25 Jun 2019 06:04:55 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id b62sm2243815ljb.71.2019.06.25.06.04.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 25 Jun 2019 06:04:54 -0700 (PDT)
Date: Tue, 25 Jun 2019 05:43:20 -0700
From: Olof Johansson <olof@lixom.net>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.3
Message-ID: <20190625124320.swddlaa7uyobu2h4@localhost>
References: <CACPK8Xdpd3Q7dexOEZqt9rP0KJz1XeRwXe6A1k1azm7eDhRm=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACPK8Xdpd3Q7dexOEZqt9rP0KJz1XeRwXe6A1k1azm7eDhRm=g@mail.gmail.com>
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

On Sat, Jun 22, 2019 at 07:59:26AM +0000, Joel Stanley wrote:
> Hi ARM maintainers,
> 
> Here is a small soc change and a fix for that same change. This is the
> first time I've had an aspeed soc pull request, so here we go.
> 
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:
> 
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/joel/aspeed.git \
>     tags/aspeed-5.3-soc
> 
> for you to fetch changes up to c8a3b9b50d8331528fc8d03aadd1fec3d60362d7:
> 
>   soc: aspeed: lpc-ctrl: Fix probe error handling (2019-06-22 16:56:35 +0930)

Merged, thanks!


-Olof
