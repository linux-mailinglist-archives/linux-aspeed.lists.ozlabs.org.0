Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E81BF896A58
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Apr 2024 11:18:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e7IkGP0P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V8fLz5MJJz3dRl
	for <lists+linux-aspeed@lfdr.de>; Wed,  3 Apr 2024 20:18:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=e7IkGP0P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V8fLl5Lmpz3020
	for <linux-aspeed@lists.ozlabs.org>; Wed,  3 Apr 2024 20:18:38 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1e0bfc42783so51661405ad.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 03 Apr 2024 02:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712135913; x=1712740713; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J/UVKbDArSXf9OPq4uUdi846hr4Zk17CJip7zdbVBGE=;
        b=e7IkGP0Pu8IlWa+7VG1VXIGeafiHPiGFCWoHo9NwuMlRfjyc/MnrIEKvVCJ5XqbGhd
         K2xoFDColNVRvM6OHgIQElXlVEK28GXD5NHQJMUK4nrG4zQJS4WGafxVDN6PhNfzZLBO
         VqGVrL4y1MCdE7816PFRoi8zeWT0pOm0qF2FHdVL/++P8vRAO9llzuDQq0sL0j/3TpN1
         Nn0tbl9Lfe7ohl02ntZ//R92gUaOy9aTJkNmYzbmhZJWTvC8vnj9xNAFor/c2Za6eXtu
         b1c8tGlwnBFFJ8xaqS2VpEtAmdLmqedmhSqHrhuWoWcf27u7rbUke8s31MIJ1WZFQNx4
         5pQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712135913; x=1712740713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/UVKbDArSXf9OPq4uUdi846hr4Zk17CJip7zdbVBGE=;
        b=VjjV9JZvhroRLIjSp9Ln+8w6erdWTlSoCEtXLP8n5fzvwJufUfSni9lwaS1eO/kB1U
         UtvguaokMn4hPcUe3OHRlVx+HXQbCxQLGC9TT7oYBfO74ozvUlUGVf8hFcNHM9GpAlIN
         KVVCPLTceA7p+clrvBqsNTW1rBS3kO3e3YIe7Ko3aT9rWPBC5O86qMVuTBET/6WGHZY+
         /tFMB6MXuJt9xqlRqW7y4e7fBJed2yhVmTdbWWV5v4V9A/fBRFvpe6hZnuKhYdziYUuH
         vDauJnVTI7ErAyJOkkNKlQc9I6d2wDBkv+UenehOxHqtPl5kdA2udHq8yNMvgTh99EwW
         QCgg==
X-Forwarded-Encrypted: i=1; AJvYcCU8OZvyybQi+j2KKLMmgLkw5XHFqFy85YxqBtVqlW0V/PQJwZnBi0fMBoP5s3hBvs0VPzjeCC87lETxkTpNZmJzoxsNMUqxNiYfX9WKfw==
X-Gm-Message-State: AOJu0Yx9i7iW+lnzka5AhhTyv8+hBWW9hpUfr9z83SJofJFy5HTEwzo7
	35g1stiTpbYfK5qYhmNmGrUuG3HsgQftSJPfkYFKE1feIx3C0VOx
X-Google-Smtp-Source: AGHT+IEaFhwRz3VWSg65jk6f3e+gnvcIMOhfysLRN3LKjo7jt1SN05PzLJCLDWUi6JBCZtwahwn/sw==
X-Received: by 2002:a17:902:f644:b0:1e2:926c:f16d with SMTP id m4-20020a170902f64400b001e2926cf16dmr1041331plg.63.1712135913591;
        Wed, 03 Apr 2024 02:18:33 -0700 (PDT)
Received: from ?IPV6:2001:b400:e307:843c:cd04:f62d:553a:c932? (2001-b400-e307-843c-cd04-f62d-553a-c932.emome-ip6.hinet.net. [2001:b400:e307:843c:cd04:f62d:553a:c932])
        by smtp.gmail.com with ESMTPSA id q4-20020a17090311c400b001e2881c8de5sm1921544plh.82.2024.04.03.02.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 02:18:33 -0700 (PDT)
Message-ID: <79b7e2ef-6f53-4642-ad3f-99b8ce780a7f@gmail.com>
Date: Wed, 3 Apr 2024 17:18:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] dt-bindings: watchdog: aspeed-wdt: Add aspeed,scu
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Rob Herring <robh@kernel.org>
References: <20240328022231.3649741-1-peteryin.openbmc@gmail.com>
 <20240328022231.3649741-4-peteryin.openbmc@gmail.com>
 <20240401135637.GA342928-robh@kernel.org>
 <ab76b0549172cf3e33d6242fa9ea3e6a87b4a58e.camel@codeconstruct.com.au>
Content-Language: en-US
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <ab76b0549172cf3e33d6242fa9ea3e6a87b4a58e.camel@codeconstruct.com.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Thanks, I can wait you update it and send a new version for wdt driver.

Andrew Jeffery 於 4/2/24 20:09 寫道:
> I had a patch converting it in a local branch which I've now sent:
> 
> https://lore.kernel.org/all/20240402120118.282035-1-andrew@codeconstruct.com.au/
> 
> Perhaps we can pull it into this series?
