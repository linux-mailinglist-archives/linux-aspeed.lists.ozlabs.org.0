Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87326B2460
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Sep 2019 18:48:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VM5w1mg1zF5nQ
	for <lists+linux-aspeed@lfdr.de>; Sat, 14 Sep 2019 02:48:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=brendanhiggins@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="NhMy/APO"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VM5r0QZQzF5jd
 for <linux-aspeed@lists.ozlabs.org>; Sat, 14 Sep 2019 02:48:31 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id q10so18443316pfl.0
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Sep 2019 09:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gW2N1i3dQ1/II0tw58Dh1ejmikzhZEzu/mpUz8rB8wk=;
 b=NhMy/APOmMD+MCKdmXfxHm15pnSkr8an9PegqY0Y2Oaciv+OcSVZmqxex01mJc+5jf
 cdMMZw1sGC+Ywi9p0oLMw48fEOXjM6aQXpiIk5VnLV7EQeLKPbVtnMf0EyxbjUl+rwbX
 DyNm9MhF2SIUuSkrGoH6GkyCng7qh59zPzlsuSv16seUQQU2XHwC40sTnBDFF1z6NM5f
 GJZbN71I6HtwC/WnUiTC66jcwyls4kcpAw3ukVubDfVNqixpHQE2jhP7Nx9npuObsL+4
 FVpSRlyda2rbpCVgArCxOGK9YNb3IGrbqpngzTx63It0EijmPCdGy4JlT/Zmn+VctU8L
 RLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gW2N1i3dQ1/II0tw58Dh1ejmikzhZEzu/mpUz8rB8wk=;
 b=lCR4qt0X3OLXFD42bSqBz9b53Tx6xcRkmjRWxLAksdWQT9XWq14pH3SjTFWm24WgEv
 qZkisMbKt4xH7EfU7D0J1u8VUk4aTH39oSorL8PHXnWhI6/3/ygqEqeeCjzvjDQS2Io9
 vwsODYVt66DyLmqwvSHnudZYwRDBcoGNcBp0o7lFX1uwhhOmUGsBxtEaW7VRj9z3yd+B
 GJDwJ4AbtLlKVP4g1cu4i0JdRW2CM8KQwufOE5r+3fHswVWGje1eCHh/S+HQIV9UKtZE
 9AsiG3hZIUmyadGC1EykAg4hoAuipHpN4wSTtmU4eeE1Gg0Zd4jGkGdb6JTYS7VjJWa9
 NNTg==
X-Gm-Message-State: APjAAAWSyYx9VnX0hN59BDDhgCNLMOXtvhqMLW7bkq9GdkE4hFbp5e1x
 Zr2A9Uw0ZPcKAPuGNDP35P++Kg==
X-Google-Smtp-Source: APXvYqwBu4eLOKb28t6qtNtdNBCKtNWHQYJ5sXVXd/zYhLtXCm0scT1SEcsP0hEMNdo7XbVmtYvSqw==
X-Received: by 2002:a17:90a:cc04:: with SMTP id
 b4mr6039257pju.127.1568393308933; 
 Fri, 13 Sep 2019 09:48:28 -0700 (PDT)
Received: from google.com ([2620:15c:2cb:1:e90c:8e54:c2b4:29e7])
 by smtp.gmail.com with ESMTPSA id v5sm30831622pfv.76.2019.09.13.09.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 09:48:28 -0700 (PDT)
Date: Fri, 13 Sep 2019 09:48:23 -0700
From: Brendan Higgins <brendanhiggins@google.com>
To: Eddie James <eajames@linux.ibm.com>
Subject: Re: [PATCH 2/2] dt-bindings: i2c: Aspeed: Add AST2600 compatible
Message-ID: <20190913164823.GB52781@google.com>
References: <1568392510-866-1-git-send-email-eajames@linux.ibm.com>
 <1568392510-866-3-git-send-email-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568392510-866-3-git-send-email-eajames@linux.ibm.com>
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

On Fri, Sep 13, 2019 at 11:35:10AM -0500, Eddie James wrote:
> Document the AST2600 I2C bus compatible string.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>

Thanks!
