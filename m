Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20249B2459
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Sep 2019 18:47:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VM5600f7zF5nF
	for <lists+linux-aspeed@lfdr.de>; Sat, 14 Sep 2019 02:47:54 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dCdFJVPR"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VM4z751bzF5jx
 for <linux-aspeed@lists.ozlabs.org>; Sat, 14 Sep 2019 02:47:46 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id b10so13530294plr.4
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Sep 2019 09:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=O2GrZSCWrGyTvU5B/RJG4lzDoBeHKSl0cnXPuD6j5Ww=;
 b=dCdFJVPRnuKvPqm7/HrWrh/QdrJEjpQdMC+Ed9rsYxbh1kRzr6HsOSKreT8+Ty7Kyd
 RyfTnUmDPzP9+l8/sY24MhB8uUdQW+O50kVmcIlkQhKQd6YDTBVOfuLGLM1sAdXfBukL
 hprMlbZn+Ao+TkhwaL76RvOuZ9BCK5vQYU4wb8kwWOJf6Z+e8WbvxZpCM/pSd7HkyrOf
 H1TTfCsP23M4iEG3lWUn1MTUVVzhEOb14M2i2J4E4p7AbEQRZ68jvm/updzs84fynH1d
 mlrKxPx+2/aABifiY35WaMi8roQQwNp1/wVZFOXhy+31c5AXlJN0v13H6nlDPVLDvQa3
 +Eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O2GrZSCWrGyTvU5B/RJG4lzDoBeHKSl0cnXPuD6j5Ww=;
 b=g8NBhKv8aW1GUGBNXoHpfAzMtLnUvwoMKGGRAU1A3FHi+s8l11CjN0zY1gIGbCYXzm
 qOJ5mHng1f+cG6KWVa2F7kz/8TLBT3CvFWcdXq9UGfKlxoAwGHV+SiCQE9bzh27RCs3q
 Faa3Xxt5nVkLi/bfseUfyDpstwFwN2Cs2ITHblsIwfE8YmS/E5lSF6PYDNUTo8s+Y84J
 bMDYCcYnUr0GrLouRVyb6dBfKmPIrjsloe0mpljltGBGvz1nbLEovjW68hsGw2laIZsR
 /ROMOOjrk+/qR3Dch+HUjHwzjxVWvN1Txwvjbt3GUGgEinELnqDJH1zByHI1yTELtC4J
 GxzQ==
X-Gm-Message-State: APjAAAUmOHzTBempaEa9OtPqV6nlB1GZuJJUciPFGQM7YXN0u0Yunj5K
 I/K+nCo07Rvhlmi6u3BCQrapHQ==
X-Google-Smtp-Source: APXvYqzCT2ZHq1pz5aqPi5tYLzQFiM+ozl2W/CkKQWfKF1qwLfAt7FbJn2Pxm8l9A/GMmyWGXxj2gQ==
X-Received: by 2002:a17:902:581:: with SMTP id
 f1mr49614453plf.246.1568393261984; 
 Fri, 13 Sep 2019 09:47:41 -0700 (PDT)
Received: from google.com ([2620:15c:2cb:1:e90c:8e54:c2b4:29e7])
 by smtp.gmail.com with ESMTPSA id j126sm25738962pfb.186.2019.09.13.09.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 09:47:41 -0700 (PDT)
Date: Fri, 13 Sep 2019 09:47:36 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 1/2] i2c: Aspeed: Add AST2600 compatible
Message-ID: <20190913164736.GA52781@google.com>
References: <1568392510-866-1-git-send-email-eajames@linux.ibm.com>
 <1568392510-866-2-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568392510-866-2-git-send-email-eajames@linux.ibm.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-i2c@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Sep 13, 2019 at 11:35:09AM -0500, Eddie James wrote:
> The driver default behavior works with the AST2600. We need a new
> compatible though to make sure the driver doesn't enable AST2400 or
> AST2500 behavior.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!
